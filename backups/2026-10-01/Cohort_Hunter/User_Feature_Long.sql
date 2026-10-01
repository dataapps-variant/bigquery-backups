-- =====================================================================
-- Profitable Cohort Hunter v2  ·  Consolidated build (features + metrics)
-- Grain: ONE ROW PER SUBSCRIPTION
--   sub_key = CONCAT(Updated_Cust_ID, '|', root_order)
--   root_order = COALESCE(NULLIF(Parent_Order_Id,''), Order_Id)  [stable chain root]
--
-- METRICS (per user, per spec)
--   net_bcN          : per-cycle Net ARPU = Order_Price_Net_of_Tax_USD at absolute BC N
--                      (net of tax, GROSS of refund -- FLAG A)
--   cum_net_arpu_bcN : cumulative Net ARPU (BC1 = BC0+BC1, BC2 = BC0+BC1+BC2, ...)
--   cac              : daily CAC for the subscription's product on its acquisition date,
--                      broadcast to every BC. daily CAC = daily_spend / daily_new_users,
--                      keyed on Product_Name_Final_Merged ONLY.
--                      *** No CAC for organic afid_channel 90 / 91 / 99 (no spend ever) ***
--   net_ltv_bcN      : cum_net_arpu_bcN - cac   (NULL when cac is NULL, incl. organic)
--   bc4_net_ltv      : Net LTV at BC4 (= net_ltv_bc4), single broadcast column
--
-- Absent cycle rule (v1): net_bcN = 0 when no approved txn at that BC.
--   is_bc4_mature flags whether BC4 has calendar-arrived (FLAG B).
-- =====================================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Cohort_Hunter.User_Feature_Table`
PARTITION BY acquisition_date
CLUSTER BY app_name, afid_channel, product_name_final_merged
OPTIONS(
  description="Profitable Cohort Hunter v2. One row per subscription; features frozen at acquisition, per-BC Net ARPU / cumulative ARPU / CAC / Net LTV computed. No CAC for organic channels 90/91/99."
)
AS
WITH
-- ---------------------------------------------------------------------
-- Acquisition row + frozen features (deduped to 1 row per subscription)
-- ---------------------------------------------------------------------
acq AS (
  SELECT
    v.*,
    COALESCE(NULLIF(v.Parent_Order_Id, ''), v.Order_Id) AS root_order
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` v
  WHERE v.Billing_Cycle_Updated = IF(v.Trial_Type = 'NT', 1, 0)   -- acquisition row
    AND (v.Test IS NULL OR v.Test IN ('', '0'))
  QUALIFY ROW_NUMBER() OVER (
    PARTITION BY v.Updated_Cust_ID, COALESCE(NULLIF(v.Parent_Order_Id,''), v.Order_Id)
    ORDER BY v.Date_of_Sale, v.Order_Id
  ) = 1
),

-- retry lives only in _W_EC; approved row carries the attempt it succeeded on.
retry AS (
  SELECT Order_Id, MAX(SAFE_CAST(Retry_Attempt AS INT64)) AS retry_attempt
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
  GROUP BY Order_Id
),

-- ---------------------------------------------------------------------
-- Per-BC outcome pivot: gather ALL cycles of a subscription by root,
-- sum Net ARPU per absolute BC 0..4. Refund / chargeback tracked separately.
-- ---------------------------------------------------------------------
sub_outcomes AS (
  SELECT
    CONCAT(v.Updated_Cust_ID, '|', COALESCE(NULLIF(v.Parent_Order_Id,''), v.Order_Id)) AS sub_key,
    MAX(v.Billing_Cycle_Updated) AS cycles_reached,
    SUM(IF(v.Billing_Cycle_Updated = 0, v.Order_Price_Net_of_Tax_USD, 0)) AS net_bc0,
    SUM(IF(v.Billing_Cycle_Updated = 1, v.Order_Price_Net_of_Tax_USD, 0)) AS net_bc1,
    SUM(IF(v.Billing_Cycle_Updated = 2, v.Order_Price_Net_of_Tax_USD, 0)) AS net_bc2,
    SUM(IF(v.Billing_Cycle_Updated = 3, v.Order_Price_Net_of_Tax_USD, 0)) AS net_bc3,
    SUM(IF(v.Billing_Cycle_Updated = 4, v.Order_Price_Net_of_Tax_USD, 0)) AS net_bc4,
    SUM(COALESCE(v.Refund_Amount_USD, 0)) AS refund_amount,
    -- Ethoca fix: on chargeback rows count GREATEST(refund, order total), not their sum
    SUM(IF(v.Is_Chargeback = '1',
           GREATEST(COALESCE(v.Refund_Amount_USD,0), COALESCE(v.Order_Total_USD,0)),
           0)) AS chargeback_amount
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` v
  WHERE (v.Test IS NULL OR v.Test IN ('', '0'))
  GROUP BY sub_key
),

-- ---------------------------------------------------------------------
-- Daily CAC  (proc_Final_Table logic, reduced to product only)
-- ---------------------------------------------------------------------
dnu_all AS (
  SELECT
    Date_of_Sale AS d,
    Product_Name_Final_Merged AS prod,
    COUNT(DISTINCT Updated_Cust_ID) AS new_users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE ((Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
      OR (Trial_Type != 'NT' AND Billing_Cycle_Updated = 0))
    AND (Test IS NULL OR Test IN ('', '0'))
  GROUP BY 1, 2
),
dsp_all AS (
  SELECT
    Date AS d,
    Product_Name_Final_Merged AS prod,
    SUM(allocated_spend) AS spend
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  GROUP BY 1, 2
),
daily_cac AS (
  SELECT
    COALESCE(u.d, s.d)       AS d,
    COALESCE(u.prod, s.prod) AS prod,
    SAFE_DIVIDE(s.spend, u.new_users) AS cac
  FROM dnu_all u
  FULL JOIN dsp_all s ON u.d = s.d AND u.prod = s.prod
),

-- ---------------------------------------------------------------------
-- Assemble features + retry + outcomes + effective CAC
-- (CAC computed ONCE here, with the organic-channel rule, so LTV can reuse it)
-- ---------------------------------------------------------------------
base AS (
  SELECT
    -- keys / identity
    CONCAT(a.Updated_Cust_ID, '|', a.root_order) AS sub_key,
    a.Updated_Cust_ID                            AS updated_cust_id,
    a.root_order                                 AS parent_order_id,
    a.Order_Id                                   AS acquisition_order_id,
    a.Entity_Name                                AS entity_name,
    a.App_Name                                   AS app_name,
    a.Date_of_Sale                               AS acquisition_date,

    -- frozen features
    a.Product_Name_Final_Merged                  AS product_name_final_merged,
    a.Trial_Type                                 AS trial_type,
    (a.Trial_Type = 'NT')                        AS is_nt,
    a.AFID                                        AS afid,
    a.AFID_CHANNEL                                AS afid_channel,
    a.Campaign_Id                                 AS campaign_id,
    a.Spend_Country_Code_AFID                     AS spend_country_code_afid,
    a.Payment                                     AS payment,
    a.Gateway_Id                                  AS gateway_id,
    a.Decline_Reason_Category                     AS decline_reason_category,
    a.Fault_Category                              AS fault_category,
    COALESCE(r.retry_attempt, 1)                  AS retry_attempt_at_acquisition,
    a.BIN                                         AS bin,
    FORMAT_DATE('%A', a.Date_of_Sale)             AS acq_day_of_week,
    EXTRACT(DAY   FROM a.Date_of_Sale)            AS acq_day_of_month,
    EXTRACT(MONTH FROM a.Date_of_Sale)            AS acq_month,
    CAST(NULL AS TIMESTAMP)                       AS time_of_sale,   -- parked
    CAST(NULL AS STRING)                          AS device,         -- parked

    -- per-cycle Net ARPU (net of tax, gross of refund)
    o.net_bc0, o.net_bc1, o.net_bc2, o.net_bc3, o.net_bc4,

    -- effective CAC: organic channels 90/91/99 never have spend -> no CAC
    IF(a.AFID_CHANNEL IN (90, 91, 99), NULL, c.cac) AS cac,

    -- refund / chargeback (separate, not netted into ARPU)
    o.refund_amount,
    o.chargeback_amount,

    -- maturity helpers
    o.cycles_reached,
    DATE_ADD(a.Date_of_Sale, INTERVAL (4 - IF(a.Trial_Type = 'NT', 1, 0)) MONTH) <= CURRENT_DATE()
      AS is_bc4_mature,

    CURRENT_TIMESTAMP() AS last_refreshed

  FROM acq a
  LEFT JOIN retry r
    ON r.Order_Id = a.Order_Id
  LEFT JOIN sub_outcomes o
    ON o.sub_key = CONCAT(a.Updated_Cust_ID, '|', a.root_order)
  LEFT JOIN daily_cac c
    ON c.d = a.Date_of_Sale
    AND c.prod = a.Product_Name_Final_Merged
)

-- ---------------------------------------------------------------------
-- Final: add cumulative Net ARPU and Net LTV (reuse the effective cac)
-- ---------------------------------------------------------------------
SELECT
  base.*,

  -- cumulative Net ARPU
  net_bc0                                             AS cum_net_arpu_bc0,
  net_bc0 + net_bc1                                   AS cum_net_arpu_bc1,
  net_bc0 + net_bc1 + net_bc2                         AS cum_net_arpu_bc2,
  net_bc0 + net_bc1 + net_bc2 + net_bc3               AS cum_net_arpu_bc3,
  net_bc0 + net_bc1 + net_bc2 + net_bc3 + net_bc4     AS cum_net_arpu_bc4,

  -- Net LTV per BC = cumulative Net ARPU - cac  (NULL for organic channels)
  (net_bc0)                                       - cac AS net_ltv_bc0,
  (net_bc0 + net_bc1)                             - cac AS net_ltv_bc1,
  (net_bc0 + net_bc1 + net_bc2)                   - cac AS net_ltv_bc2,
  (net_bc0 + net_bc1 + net_bc2 + net_bc3)         - cac AS net_ltv_bc3,
  (net_bc0 + net_bc1 + net_bc2 + net_bc3 + net_bc4) - cac AS net_ltv_bc4,

  -- BC4 Net LTV (single broadcast column)
  (net_bc0 + net_bc1 + net_bc2 + net_bc3 + net_bc4) - cac AS bc4_net_ltv

FROM base;
