-- =============================================================================
-- REFUND TABLE V2.0 — WITH PAYMENT & GATEWAY_ID AT ANCHOR
-- =============================================================================
--
-- CHANGES FROM ORIGINAL:
--   1. Added Payment & Gateway_Id to the grain:
--      Report_Date × Product_Name_Final × Billing_Cycle × Country_Code × Payment × Gateway_Id
--   2. Payment & Gateway_Id are locked at the ANCHOR BC (Option A):
--      BC0 for non-NT, BC1 for NT — carried forward to all subsequent BCs.
--   3. 7K cap now applies per Product × Country_Code × Payment × Gateway_Id.
--   4. Refund matching does NOT filter by Payment/Gateway_Id (Option A):
--      customer is labeled at anchor, refund counted regardless of method.
--   5. Base table unchanged: Sticky_data_API_original_V_Merged_TBL
--   6. Gateway alias lookup added via Sticky_Dim_Gateways (Entity + Gateway_ID match).
--   7. All PARTITION BY, GROUP BY, JOIN conditions updated for new grain.
--
-- =============================================================================
CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Refund_Table_Payment_Gateway` AS

WITH
-- =====================================================
-- CONFIGURATION VARIABLES
-- =====================================================
config AS (
  SELECT
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS report_start_date,
    DATE('2025-01-01') AS report_end_date,
    7000 AS cohort_size,
    100 AS minimum_user_count,
    30 AS retry_engine_period,
    12 AS max_billing_cycles,
    30 AS default_regular_bc_period,
    0.20 AS refund_ratio_threshold,
    30 AS minimum_refund_count
),

-- =====================================================
-- BASE STRUCTURE GENERATION
-- =====================================================
report_dates AS (
  SELECT report_date
  FROM UNNEST(GENERATE_DATE_ARRAY(
    (SELECT report_end_date FROM config),
    (SELECT report_start_date FROM config),
    INTERVAL 1 DAY
  )) AS report_date
),

product_list AS (
  SELECT DISTINCT
    Product_Name_Final,
    Country_Code
  FROM `variant-finance-data-project.ICARUS_Multi.Plan_List`
  WHERE Product_Name_Final IS NOT NULL
),

billing_cycle_range AS (
  SELECT billing_cycle
  FROM UNNEST(GENERATE_ARRAY(0, (SELECT max_billing_cycles FROM config))) AS billing_cycle
),

-- =====================================================
-- MASTER COMBINATIONS TABLE
-- (No Payment/Gateway here — attached later via anchor lookup)
-- =====================================================
master_combinations AS (
  SELECT
    rd.report_date,
    pl.Product_Name_Final,
    pl.Country_Code,
    bcr.billing_cycle,
    cfg.cohort_size,
    cfg.minimum_user_count,
    cfg.retry_engine_period,
    cfg.default_regular_bc_period,
    cfg.refund_ratio_threshold,
    cfg.minimum_refund_count
  FROM report_dates rd
  CROSS JOIN product_list pl
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
),

-- =====================================================
-- PLAN_LIST AGGREGATION (unchanged)
-- =====================================================
plan_list_ranked AS (
  SELECT
    Product_Name_Final,
    Country_Code,
    Entity_Name,
    App_Name,
    Trial_Type,
    Trial_Period,
    Currency,
    Trial_Price,
    Regular_Price,
    ROW_NUMBER() OVER (PARTITION BY Product_Name_Final, Country_Code ORDER BY Trial_Price) AS rn
  FROM `variant-finance-data-project.ICARUS_Multi.Plan_List`
  WHERE Product_Name_Final IS NOT NULL
),

plan_list_first_record AS (
  SELECT
    Product_Name_Final,
    Country_Code,
    Entity_Name,
    App_Name,
    Trial_Type,
    Trial_Period,
    Currency,
    Regular_Price
  FROM plan_list_ranked
  WHERE rn = 1
),

plan_list_trial_price_avg AS (
  SELECT
    Product_Name_Final,
    Country_Code,
    AVG(Trial_Price) AS Trial_Price
  FROM `variant-finance-data-project.ICARUS_Multi.Plan_List`
  WHERE Product_Name_Final IS NOT NULL
  GROUP BY Product_Name_Final, Country_Code
),

aggregated_plan_list AS (
  SELECT
    fr.Product_Name_Final,
    fr.Country_Code,
    fr.Entity_Name,
    fr.App_Name,
    fr.Trial_Type,
    fr.Trial_Period,
    fr.Currency,
    fr.Regular_Price,
    tp.Trial_Price
  FROM plan_list_first_record fr
  INNER JOIN plan_list_trial_price_avg tp
    ON fr.Product_Name_Final = tp.Product_Name_Final
    AND fr.Country_Code = tp.Country_Code
),

-- =====================================================
-- PRODUCT ATTRIBUTES ENRICHMENT (unchanged)
-- =====================================================
enriched_master AS (
  SELECT
    mc.report_date,
    mc.Product_Name_Final,
    mc.Country_Code,
    mc.billing_cycle,
    mc.cohort_size,
    mc.minimum_user_count,
    mc.retry_engine_period,
    mc.default_regular_bc_period,
    mc.refund_ratio_threshold,
    mc.minimum_refund_count,
    apl.Entity_Name,
    apl.App_Name,
    apl.Trial_Type,
    apl.Trial_Period,
    apl.Currency,
    apl.Trial_Price,
    apl.Regular_Price
  FROM master_combinations mc
  LEFT JOIN aggregated_plan_list apl
    ON mc.Product_Name_Final = apl.Product_Name_Final
    AND mc.Country_Code = apl.Country_Code
),

-- =====================================================
-- BUSINESS LOGIC CALCULATIONS (unchanged)
-- =====================================================
business_logic AS (
  SELECT
    em.report_date,
    em.Product_Name_Final,
    em.billing_cycle,
    em.cohort_size,
    em.minimum_user_count,
    em.retry_engine_period,
    em.default_regular_bc_period,
    em.refund_ratio_threshold,
    em.minimum_refund_count,
    em.Entity_Name,
    em.App_Name,
    em.Trial_Type,
    em.Trial_Period,
    em.Currency,
    em.Trial_Price,
    em.Regular_Price,
    em.Country_Code,

    COALESCE(delay_map.`Delay days`, em.default_regular_bc_period) AS calculated_regular_bc_period,

    CASE
      WHEN em.billing_cycle = 0 THEN 0
      WHEN em.billing_cycle = 1 AND em.Trial_Type = 'NT' THEN 1
      WHEN em.billing_cycle = 1 AND em.Trial_Type != 'NT' THEN 0
      ELSE em.billing_cycle - 1
    END AS calculated_denominator_bc,

    CASE
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle = 0 THEN
        DATE_SUB(DATE_SUB(em.report_date, INTERVAL em.Trial_Period DAY), INTERVAL 1 DAY)
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle >= 1 THEN
        DATE_SUB(DATE_SUB(DATE_SUB(em.report_date, INTERVAL em.Trial_Period DAY),
                  INTERVAL em.billing_cycle * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period) DAY), INTERVAL 1 DAY)
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle = 0 THEN em.report_date
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle >= 1 THEN
        DATE_SUB(DATE_SUB(em.report_date, INTERVAL em.billing_cycle * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period) DAY), INTERVAL 1 DAY)
    END AS calculated_bc_start_date,

    CASE
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle = 0 THEN 0
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle = 1 THEN em.Trial_Period
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle >= 2 THEN
        em.Trial_Period + ((em.billing_cycle - 1) * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period))
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle = 0 THEN 0
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle = 1 THEN 0
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle >= 2 THEN
        (em.billing_cycle - 1) * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period)
    END AS calculated_start_offset_days,

    CASE
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle = 0 THEN em.Trial_Period - 1
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle >= 1 THEN
        em.Trial_Period + (em.billing_cycle * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period)) - 1
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle = 0 THEN 0
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle >= 1 THEN
        (em.billing_cycle * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period)) - 1
    END AS calculated_end_offset_days,

    CASE
      WHEN em.Trial_Type = 'NT' THEN 1
      ELSE 0
    END AS cohort_selection_bc

  FROM enriched_master em
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map` delay_map
    ON em.Product_Name_Final = delay_map.`Plan Name`
),

-- =====================================================
-- EXCHANGE RATE CALCULATION (unchanged)
-- =====================================================
exchange_rates AS (
  SELECT
    bl.report_date,
    bl.Product_Name_Final,
    bl.billing_cycle,
    bl.Country_Code,
    bl.Currency,
    bl.calculated_bc_start_date,

    CASE
      WHEN bl.Currency = 'USD' THEN 1.0
      ELSE COALESCE(AVG(er.Value_USD), 1.0)
    END AS final_exchange_rate

  FROM business_logic bl
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate` er
    ON bl.Currency = er.Currency
    AND er.Date <= bl.calculated_bc_start_date
  GROUP BY bl.report_date, bl.Product_Name_Final, bl.billing_cycle, bl.Country_Code, bl.Currency, bl.calculated_bc_start_date
),

-- =====================================================
-- NEW: ANCHOR ATTRIBUTES — Payment & Gateway_Id at anchor BC
-- Priority: most recent approved; fallback to most recent overall
-- Uses the SAME base table as this script (V_Merged, not V_W_EC_Merged)
-- =====================================================
anchor_attributes AS (
  SELECT
    Updated_Cust_ID,
    Product_Name_Final_Merged,
    Country_Segment,
    Payment,
    Gateway_Id
  FROM (
    SELECT
      Updated_Cust_ID,
      Product_Name_Final_Merged,
      -- Derive Country_Segment to match cohort selection logic
      CASE
        WHEN Spend_Country_Code_AFID = 'JP' THEN 'JP'
        WHEN Spend_Country_Code_AFID != 'JP' OR Spend_Country_Code_AFID IS NULL THEN 'Non-JP'
      END AS Country_Segment,
      Payment,
      Gateway_Id,
      ROW_NUMBER() OVER (
        PARTITION BY
          Updated_Cust_ID,
          Product_Name_Final_Merged,
          CASE
            WHEN Spend_Country_Code_AFID = 'JP' THEN 'JP'
            WHEN Spend_Country_Code_AFID != 'JP' OR Spend_Country_Code_AFID IS NULL THEN 'Non-JP'
          END
        ORDER BY
          CASE WHEN Final_Order_Status IN (2, 6, 8) THEN 0 ELSE 1 END,
          Date_of_Sale DESC
      ) AS rn
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE
      -- Anchor BC rows only
      (Trial_Type <> 'NT' AND Billing_Cycle_Updated = 0)
      OR (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
  )
  WHERE rn = 1
),

-- =====================================================
-- COHORT SELECTION — MODIFIED
-- Now joins to anchor_attributes to label each customer
-- 7K cap per Product × Country_Code × Payment × Gateway_Id
-- =====================================================
eligible_transactions AS (
  SELECT
    bl.report_date,
    bl.Product_Name_Final,
    bl.billing_cycle,
    bl.cohort_size,
    bl.calculated_bc_start_date,
    bl.cohort_selection_bc,
    bl.Country_Code,
    aa.Payment,
    aa.Gateway_Id,
    base.Updated_Cust_ID,
    base.Date_of_Sale,
    ROW_NUMBER() OVER (
      PARTITION BY
        bl.report_date,
        bl.Product_Name_Final,
        bl.billing_cycle,
        bl.Country_Code,
        aa.Payment,
        aa.Gateway_Id
      ORDER BY base.Date_of_Sale DESC
    ) AS transaction_rank
  FROM business_logic bl
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bl.Product_Name_Final = base.Product_Name_Final_Merged
    AND base.Billing_Cycle_Updated = bl.cohort_selection_bc
    AND base.Date_of_Sale <= bl.calculated_bc_start_date
    AND (
      (bl.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (bl.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (bl.Country_Code IS NULL OR bl.Country_Code = '' OR TRIM(bl.Country_Code) = '')
    )
  -- Attach anchor Payment & Gateway_Id
  INNER JOIN anchor_attributes aa
    ON aa.Updated_Cust_ID = base.Updated_Cust_ID
    AND aa.Product_Name_Final_Merged = base.Product_Name_Final_Merged
    AND (
      (bl.Country_Code = 'JP' AND aa.Country_Segment = 'JP')
      OR (bl.Country_Code = 'Non-JP' AND aa.Country_Segment = 'Non-JP')
      OR (bl.Country_Code IS NULL OR bl.Country_Code = '' OR TRIM(bl.Country_Code) = '')
    )
),

selected_cohort AS (
  SELECT
    report_date,
    Product_Name_Final,
    billing_cycle,
    Country_Code,
    Payment,
    Gateway_Id,
    Updated_Cust_ID,
    Date_of_Sale
  FROM eligible_transactions
  WHERE transaction_rank <= cohort_size
),

-- =====================================================
-- COHORT ANALYSIS — MODIFIED for new grain
-- =====================================================
cohort_analysis AS (
  SELECT
    subq.report_date,
    subq.Product_Name_Final,
    subq.billing_cycle,
    subq.Country_Code,
    subq.Payment,
    subq.Gateway_Id,
    MIN(subq.Date_of_Sale) AS oldest_transaction_date,
    COUNT(*) AS actual_cohort_count,
    MAX(subq.cohort_size) AS cohort_size
  FROM (
    SELECT
      et.report_date,
      et.Product_Name_Final,
      et.billing_cycle,
      et.Country_Code,
      et.Payment,
      et.Gateway_Id,
      et.cohort_size,
      et.Updated_Cust_ID,
      et.Date_of_Sale,
      et.transaction_rank
    FROM eligible_transactions et
    WHERE et.transaction_rank <= et.cohort_size
  ) subq
  GROUP BY
    subq.report_date,
    subq.Product_Name_Final,
    subq.billing_cycle,
    subq.Country_Code,
    subq.Payment,
    subq.Gateway_Id
),

bc_end_date_calculation AS (
  SELECT
    ca.*,
    bl.calculated_bc_start_date,
    ca.oldest_transaction_date AS calculated_bc_end_date
  FROM cohort_analysis ca
  INNER JOIN business_logic bl
    ON ca.report_date = bl.report_date
    AND ca.Product_Name_Final = bl.Product_Name_Final
    AND ca.billing_cycle = bl.billing_cycle
    AND ca.Country_Code = bl.Country_Code
),

-- =====================================================
-- REFUND CALCULATION — MODIFIED
-- Payment & Gateway_Id carried from selected_cohort (anchor label)
-- Refund transactions NOT filtered by Payment/Gateway (Option A)
-- =====================================================
all_customer_refunds AS (
  SELECT
    sc.report_date,
    sc.Product_Name_Final,
    sc.billing_cycle,
    sc.Country_Code,
    sc.Payment,
    sc.Gateway_Id,
    sc.Updated_Cust_ID,
    sc.Date_of_Sale AS original_purchase_date,
    base.Refund_Date,
    base.Refund_Amount_USD,
    base.Order_Id
  FROM selected_cohort sc
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON sc.Updated_Cust_ID = base.Updated_Cust_ID
    AND sc.Product_Name_Final = base.Product_Name_Final_Merged
    -- Country_Code filtering (same as original)
    AND (
      (sc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (sc.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (sc.Country_Code IS NULL OR sc.Country_Code = '' OR TRIM(sc.Country_Code) = '')
    )
    -- NOTE: No filter on Payment or Gateway_Id here (Option A)
  WHERE base.Refund_Amount_USD > 0
    AND base.Refund_Date IS NOT NULL
),

filtered_refunds AS (
  SELECT
    acr.*,
    bl.calculated_start_offset_days,
    bl.calculated_end_offset_days,
    bl.Trial_Type
  FROM all_customer_refunds acr
  INNER JOIN business_logic bl
    ON acr.report_date = bl.report_date
    AND acr.Product_Name_Final = bl.Product_Name_Final
    AND acr.billing_cycle = bl.billing_cycle
    AND acr.Country_Code = bl.Country_Code
  WHERE acr.Refund_Date BETWEEN
    DATE_ADD(acr.original_purchase_date, INTERVAL bl.calculated_start_offset_days DAY) AND
    DATE_ADD(acr.original_purchase_date, INTERVAL bl.calculated_end_offset_days DAY)
),

refund_metrics AS (
  SELECT
    fr.report_date,
    fr.Product_Name_Final,
    fr.billing_cycle,
    fr.Country_Code,
    fr.Payment,
    fr.Gateway_Id,
    fr.Trial_Type,

    CASE
      WHEN fr.Trial_Type = 'NT' AND fr.billing_cycle = 0 THEN 0
      ELSE COUNT(DISTINCT fr.Order_Id)
    END AS final_refund_count,

    CASE
      WHEN fr.Trial_Type = 'NT' AND fr.billing_cycle = 0 THEN 0.0
      ELSE SUM(fr.Refund_Amount_USD)
    END AS final_refund_amount

  FROM filtered_refunds fr
  GROUP BY
    fr.report_date,
    fr.Product_Name_Final,
    fr.billing_cycle,
    fr.Country_Code,
    fr.Payment,
    fr.Gateway_Id,
    fr.Trial_Type
),

-- =====================================================
-- CORE METRICS ASSEMBLY — MODIFIED for new grain
-- =====================================================
core_metrics AS (
  SELECT
    bl.report_date,
    bl.Product_Name_Final,
    bl.billing_cycle,
    bl.cohort_size,
    bl.minimum_user_count,
    bl.retry_engine_period,
    bl.default_regular_bc_period,
    bl.refund_ratio_threshold,
    bl.minimum_refund_count,
    bl.Entity_Name,
    bl.App_Name,
    bl.Trial_Type,
    bl.Trial_Period,
    bl.Currency,
    bl.Trial_Price,
    bl.Regular_Price,
    bl.Country_Code,
    bl.calculated_regular_bc_period,
    bl.calculated_denominator_bc,
    bl.calculated_bc_start_date,
    bl.calculated_start_offset_days,
    bl.calculated_end_offset_days,
    bl.cohort_selection_bc,
    er.final_exchange_rate,
    bedc.calculated_bc_end_date,
    bedc.Payment,
    bedc.Gateway_Id,

    CASE
      WHEN bedc.actual_cohort_count = bedc.cohort_size THEN bedc.cohort_size
      ELSE bedc.actual_cohort_count
    END AS final_cohort_final_users,

    COALESCE(rm.final_refund_count, 0) AS clean_refund_count,
    COALESCE(rm.final_refund_amount, 0.0) AS clean_refund_amount

  FROM business_logic bl
  -- bc_end_date_calculation now carries Payment & Gateway_Id
  -- This is the driving table for the new grain dimensions
  INNER JOIN bc_end_date_calculation bedc
    ON bl.report_date = bedc.report_date
    AND bl.Product_Name_Final = bedc.Product_Name_Final
    AND bl.billing_cycle = bedc.billing_cycle
    AND bl.Country_Code = bedc.Country_Code
  LEFT JOIN exchange_rates er
    ON bl.report_date = er.report_date
    AND bl.Product_Name_Final = er.Product_Name_Final
    AND bl.billing_cycle = er.billing_cycle
    AND bl.Country_Code = er.Country_Code
  LEFT JOIN refund_metrics rm
    ON bl.report_date = rm.report_date
    AND bl.Product_Name_Final = rm.Product_Name_Final
    AND bl.billing_cycle = rm.billing_cycle
    AND bl.Country_Code = rm.Country_Code
    AND bedc.Payment = rm.Payment
    AND bedc.Gateway_Id = rm.Gateway_Id
),

-- =====================================================
-- FINAL CALCULATIONS — MODIFIED for new grain
-- =====================================================
final_calculations AS (
  SELECT
    cm.report_date,
    cm.Product_Name_Final,
    cm.billing_cycle,
    cm.cohort_size,
    cm.minimum_user_count,
    cm.retry_engine_period,
    cm.default_regular_bc_period,
    cm.refund_ratio_threshold,
    cm.minimum_refund_count,
    cm.Entity_Name,
    cm.App_Name,
    cm.Trial_Type,
    cm.Trial_Period,
    cm.Currency,
    cm.Trial_Price,
    cm.Regular_Price,
    cm.Country_Code,
    cm.calculated_regular_bc_period,
    cm.calculated_denominator_bc,
    cm.calculated_bc_start_date,
    cm.calculated_start_offset_days,
    cm.calculated_end_offset_days,
    cm.cohort_selection_bc,
    cm.final_exchange_rate,
    cm.calculated_bc_end_date,
    cm.Payment,
    cm.Gateway_Id,
    cm.final_cohort_final_users,
    cm.clean_refund_count,
    cm.clean_refund_amount,

    -- Refund_Users calculation
    CASE
      WHEN cm.billing_cycle = 0 THEN
        COALESCE(SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Trial_Price * cm.final_exchange_rate, 0)), 0.0)
      ELSE
        COALESCE(SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Regular_Price * cm.final_exchange_rate, 0)), 0.0)
    END AS Refund_Users,

    -- Refund Ratio with data quality filter
    CASE
      WHEN cm.billing_cycle = 0 AND cm.Trial_Type = 'NT' THEN 0.0
      WHEN cm.billing_cycle = 0 AND cm.Trial_Type != 'NT' THEN
        CASE
          WHEN COALESCE(
                 SAFE_DIVIDE(
                   SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Trial_Price * cm.final_exchange_rate, 0)),
                   NULLIF(cm.final_cohort_final_users, 0)
                 ),
                 0.0
               ) > cm.refund_ratio_threshold
               AND cm.clean_refund_count < cm.minimum_refund_count
          THEN 0.0
          ELSE COALESCE(
                 SAFE_DIVIDE(
                   SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Trial_Price * cm.final_exchange_rate, 0)),
                   NULLIF(cm.final_cohort_final_users, 0)
                 ),
                 0.0
               )
        END
      ELSE
        CASE
          WHEN COALESCE(
                 SAFE_DIVIDE(
                   SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Regular_Price * cm.final_exchange_rate, 0)),
                   NULLIF(cm.final_cohort_final_users, 0)
                 ),
                 0.0
               ) > cm.refund_ratio_threshold
               AND cm.clean_refund_count < cm.minimum_refund_count
          THEN 0.0
          ELSE COALESCE(
                 SAFE_DIVIDE(
                   SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Regular_Price * cm.final_exchange_rate, 0)),
                   NULLIF(cm.final_cohort_final_users, 0)
                 ),
                 0.0
               )
        END
    END AS final_refund_ratio

  FROM core_metrics cm
)

-- =====================================================
-- FINAL OUTPUT
-- =====================================================
SELECT
  -- Primary Dimensions
  fc.report_date AS Report_date,
  fc.Product_Name_Final,
  fc.billing_cycle AS Billing_Cycle,

  -- Configuration Variables
  fc.cohort_size AS Cohort_Size,
  fc.minimum_user_count AS Minimum_User_count,
  fc.retry_engine_period AS Retry_engine_Period,

  -- Product Details
  fc.Entity_Name,
  CASE
    WHEN fc.Country_Code IS NULL OR fc.Country_Code = '' THEN fc.App_Name
    ELSE CONCAT(fc.App_Name, '-', fc.Country_Code)
  END AS App_Name,
  fc.Trial_Type,
  fc.Trial_Period,
  fc.Currency,
  fc.Trial_Price,
  fc.Regular_Price,
  fc.Country_Code,
  fc.calculated_regular_bc_period AS Regular_BC_period,
  fc.final_exchange_rate AS Exchange_rate,
  fc.calculated_denominator_bc AS Denominator_BC,

  -- Dates
  fc.calculated_bc_start_date AS BC_start_date,
  fc.calculated_bc_end_date AS BC_end_date,

  -- Offset Days
  fc.calculated_start_offset_days AS start_offset_days,
  fc.calculated_end_offset_days AS end_offset_days,
  fc.final_cohort_final_users AS Cohort_final_users,

  -- NEW: Payment & Gateway
  fc.Payment,
  fc.Gateway_Id,
  gw.Gateway_Alias AS Gateway,

  -- Refund Metrics
  fc.clean_refund_amount AS Refund_Amount,
  fc.Refund_Users,
  fc.final_refund_ratio AS Refund_Ratio

FROM final_calculations fc

-- Gateway alias lookup: match on Gateway_ID AND Entity
LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Gateways` gw
  ON SAFE_CAST(fc.Gateway_Id AS INT64) = gw.Gateway_ID
  AND fc.Entity_Name = gw.Entity

ORDER BY
  fc.report_date DESC,
  fc.Product_Name_Final,
  fc.Country_Code,
  fc.Payment,
  fc.Gateway_Id,
  fc.billing_cycle;
