-- job_id: bquxjob_41715baa_19fb7839b2e
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-31T09:31:23.920000+00:00
-- started: 2026-07-31T09:31:23.965000+00:00
-- ended: 2026-07-31T09:31:30.179000+00:00

-- =====================================================================
-- PHASE 0b  --  FOLLOW-UP DIAGNOSTICS
-- =====================================================================
-- Triggered by the Phase 0 results:
--   - 7-year window (2019-04 to 2026-07) is too wide to train on whole
--   - min LTV -5,028 vs p01 -116: extreme left tail needs explaining
--   - 71.6% of paid subs are net-negative at BC4
--
-- These three queries decide the training window and the outlier policy.
-- =====================================================================


-- ---------------------------------------------------------------------
-- 0.9  Volume and economics by year -- DECIDES THE TRAINING WINDOW
-- ---------------------------------------------------------------------
SELECT
  EXTRACT(YEAR FROM acquisition_date)             AS yr,
  COUNT(*)                                        AS subs,
  ROUND(AVG(bc4_net_ltv), 2)                      AS avg_net_ltv,
  ROUND(AVG(cac), 2)                              AS avg_cac,
  ROUND(AVG(cum_net_arpu_thru_bc4), 2)            AS avg_arpu,
  ROUND(100 * COUNTIF(bc4_net_ltv > 0) / COUNT(*), 1) AS pct_profitable,
  COUNT(DISTINCT gateway_id)                      AS gateways,
  COUNT(DISTINCT product_name_final_merged)       AS products,
  COUNT(DISTINCT afid_channel)                    AS channels
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL
GROUP BY 1
ORDER BY 1;

-- HOW TO READ IT:
--   Look for the year where avg_cac, avg_arpu and the product/gateway
--   counts stop looking like the present. Everything before that is a
--   different business and should not be in the training set.
--
--   Also watch subs per year. If 2019-2021 is a small share of the
--   total, dropping it costs you almost nothing.
--
--   DEFAULT RECOMMENDATION: train on 2023-01-01 onward. Adjust in
--   phase_1 once you have seen this table.


-- ---------------------------------------------------------------------
-- 0.10  What ARE the extreme negatives? -- DECIDES THE OUTLIER POLICY
-- ---------------------------------------------------------------------
SELECT
  CASE
    WHEN bc4_net_ltv < -1000 THEN 'a. below -1000'
    WHEN bc4_net_ltv <  -500 THEN 'b. -1000 to -500'
    WHEN bc4_net_ltv <  -116 THEN 'c. -500 to -116  (beyond p01)'
    WHEN bc4_net_ltv <     0 THEN 'd. -116 to 0'
    ELSE                          'e. 0 and above'
  END                                             AS bucket,
  COUNT(*)                                        AS subs,
  ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 3) AS pct_of_total,
  ROUND(AVG(cac), 2)                              AS avg_cac,
  ROUND(MAX(cac), 2)                              AS max_cac,
  ROUND(AVG(cum_net_arpu_thru_bc4), 2)            AS avg_arpu,
  COUNT(DISTINCT afid_channel)                    AS channels,
  COUNT(DISTINCT campaign_id)                     AS campaigns
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL
GROUP BY 1
ORDER BY 1;

-- HOW TO READ IT:
--   avg_cac in buckets a/b is enormous, arpu is normal
--       -> these are CAC ALLOCATION ARTEFACTS. A campaign spent heavily
--          and attributed almost nothing. Not repeatable cohort
--          behaviour. WINSORISE them (phase_1 does this by default).
--
--   avg_cac in buckets a/b is normal, arpu is hugely negative
--       -> these are real refund/chargeback disasters. That IS signal.
--          Remove the winsorisation in phase_1 and let the model see it.
--
--   buckets a+b are a tiny fraction of total
--       -> whichever way you go, it barely moves the aggregate. Cap them
--          and move on.


-- ---------------------------------------------------------------------
-- 0.11  Is cac populated for the IMMATURE rows you will be scoring?
--       If not, the "predict ARPU then subtract CAC" design cannot run
--       in production.
-- ---------------------------------------------------------------------
SELECT
  COUNT(*)                                  AS immature_paid_rows,
  COUNTIF(cac IS NULL)                      AS null_cac,
  ROUND(100 * COUNTIF(cac IS NULL) / COUNT(*), 2) AS pct_null_cac,
  ROUND(AVG(cac), 2)                        AS avg_cac
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = FALSE
  AND NOT is_organic;

-- GATE:
--   pct_null_cac near 0  -> the ARPU model design works in production
--   pct_null_cac high    -> you can only use the net-LTV model.
--                           Tell me and I will drop the ARPU branch.
