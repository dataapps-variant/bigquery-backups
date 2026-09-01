-- =====================================================================
-- Profitable Cohort Hunter  ·  Product-anchored CUBE cohorts
-- =====================================================================
-- Approach (Alternative A, multi-grain):
--   PRODUCT is always pinned. We CUBE the 5 independent dimensions on top:
--     trial_type, afid_channel, spend_country_code_afid, payment, gateway_id
--   -> 2^5 = 32 grains per product (product alone, product x each dim,
--      product x each pair, ... up to product x all five).
--
--   Every cohort is fully specified with EXACT values (never "not X").
--   A dimension that is not pinned at a given grain shows as "(any)".
--
--   entity_name and app_name are DISPLAYED for each cohort (looked up from
--   the product) but are NOT part of the grouping - product already
--   determines them.
--
-- Filters:
--   - is_bc4_mature = TRUE     (only settled BC4 economics)
--   - HAVING COUNT >= 100      (your "sizable" floor)
--
-- Profitability: a cohort is profitable if mean_bc4_net_ltv > 0.
-- =====================================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Cohort_Hunter.Cohort_Rankings`
OPTIONS(
  description="Product-anchored CUBE cohorts. Product pinned; trial_type/afid_channel/country/payment/gateway cubed. >=100 mature subs. Ranked by mean bc4_net_ltv."
)
AS
WITH
mature AS (
  SELECT
    product_name_final_merged,
    -- entity/app are functionally determined by product; carry for display
    ANY_VALUE(entity_name) OVER (PARTITION BY product_name_final_merged) AS entity_name,
    ANY_VALUE(app_name)    OVER (PARTITION BY product_name_final_merged) AS app_name,
    ANY_VALUE(trial_type)  OVER (PARTITION BY product_name_final_merged) AS trial_type,
    CAST(afid_channel AS STRING)   AS afid_channel,   -- treat as category
    spend_country_code_afid,
    payment,
    gateway_id,
    bc4_net_ltv,
    cac,
    cum_net_arpu_thru_bc4,
    is_organic
  FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
  WHERE is_bc4_mature = TRUE
    AND bc4_net_ltv IS NOT NULL
),

agg AS (
  SELECT
    product_name_final_merged,
    -- display-only (constant within a product)
    ANY_VALUE(entity_name)                       AS entity_name,
    ANY_VALUE(app_name)                          AS app_name,
    ANY_VALUE(trial_type)                        AS trial_type,

    -- the 4 cubed dimensions: NULL where rolled up ("any")
    afid_channel,
    spend_country_code_afid,
    payment,
    gateway_id,

    COUNT(*)                                     AS n_subs,
    ROUND(AVG(bc4_net_ltv), 2)                   AS mean_bc4_net_ltv,
    ROUND(AVG(cac), 2)                           AS mean_cac,
    ROUND(AVG(cum_net_arpu_thru_bc4), 2)         AS mean_arpu_thru_bc4,
    ROUND(100 * AVG(CAST(is_organic AS INT64)), 1) AS pct_organic,

    -- how many of the 4 cubed dims are pinned at this grain (0..4)
    (CASE WHEN afid_channel            IS NOT NULL THEN 1 ELSE 0 END
   + CASE WHEN spend_country_code_afid IS NOT NULL THEN 1 ELSE 0 END
   + CASE WHEN payment                 IS NOT NULL THEN 1 ELSE 0 END
   + CASE WHEN gateway_id              IS NOT NULL THEN 1 ELSE 0 END) AS specificity
  FROM mature
  GROUP BY GROUPING SETS (
    -- product is listed in EVERY set, so it is always pinned.
    -- the other 4 dims are cubed: all 16 subsets appear below.
    (product_name_final_merged),
    (product_name_final_merged, afid_channel),
    (product_name_final_merged, spend_country_code_afid),
    (product_name_final_merged, payment),
    (product_name_final_merged, gateway_id),
    (product_name_final_merged, afid_channel, spend_country_code_afid),
    (product_name_final_merged, afid_channel, payment),
    (product_name_final_merged, afid_channel, gateway_id),
    (product_name_final_merged, spend_country_code_afid, payment),
    (product_name_final_merged, spend_country_code_afid, gateway_id),
    (product_name_final_merged, payment, gateway_id),
    (product_name_final_merged, afid_channel, spend_country_code_afid, payment),
    (product_name_final_merged, afid_channel, spend_country_code_afid, gateway_id),
    (product_name_final_merged, afid_channel, payment, gateway_id),
    (product_name_final_merged, spend_country_code_afid, payment, gateway_id),
    (product_name_final_merged, afid_channel, spend_country_code_afid, payment, gateway_id)
  )
  HAVING COUNT(*) >= 100
)

SELECT
  product_name_final_merged,
  entity_name,
  app_name,
  trial_type,
  -- readable: show "(any)" where the dimension is rolled up
  IFNULL(afid_channel,            '(any)') AS afid_channel,
  IFNULL(spend_country_code_afid, '(any)') AS spend_country,
  IFNULL(payment,                 '(any)') AS payment,
  IFNULL(gateway_id,              '(any)') AS gateway_id,
  specificity,
  n_subs,
  mean_bc4_net_ltv,
  mean_cac,
  mean_arpu_thru_bc4,
  pct_organic,
  (mean_bc4_net_ltv > 0)                    AS profitable
FROM agg
ORDER BY mean_bc4_net_ltv DESC;
