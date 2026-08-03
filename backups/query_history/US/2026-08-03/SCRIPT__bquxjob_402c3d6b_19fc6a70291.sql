-- job_id: bquxjob_402c3d6b_19fc6a70291
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-08-03T08:04:22.599000+00:00
-- started: 2026-08-03T08:04:22.648000+00:00
-- ended: 2026-08-03T08:04:25.299000+00:00

-- =====================================================================
-- PHASE 0c  --  RE-CHECKS AGAINST THE NARROWED WINDOW (2024-01-01+)
-- =====================================================================
-- WHY THIS EXISTS:
--   0.9 revealed a structural break between 2023 and 2024:
--       avg net LTV  -0.15  ->  -5.30
--       channels          6  ->  11
--   The training window has moved to 2024-01-01. Two things must be
--   re-derived against that narrower population.
--
--   Also: 0.10 was not run. It is repeated here, windowed.
-- =====================================================================


-- ---------------------------------------------------------------------
-- 0.10  (RERUN) What ARE the extreme negatives?
--       DECIDES whether the winsorisation in Phase 1 stays or goes.
-- ---------------------------------------------------------------------
SELECT
  CASE
    WHEN bc4_net_ltv < -1000 THEN 'a. below -1000'
    WHEN bc4_net_ltv <  -500 THEN 'b. -1000 to -500'
    WHEN bc4_net_ltv <  -116 THEN 'c. -500 to -116'
    WHEN bc4_net_ltv <     0 THEN 'd. -116 to 0'
    ELSE                          'e. 0 and above'
  END                                              AS bucket,
  COUNT(*)                                         AS subs,
  ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 3) AS pct_of_total,
  ROUND(AVG(cac), 2)                               AS avg_cac,
  ROUND(MAX(cac), 2)                               AS max_cac,
  ROUND(AVG(cum_net_arpu_thru_bc4), 2)             AS avg_arpu,
  ROUND(MIN(cum_net_arpu_thru_bc4), 2)             AS min_arpu
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL
  AND acquisition_date >= '2024-01-01'
GROUP BY 1
ORDER BY 1;

-- DECISION RULE:
--   buckets a/b have huge avg_cac and normal avg_arpu
--       -> CAC allocation artefacts. KEEP the winsorisation.
--   buckets a/b have normal avg_cac and deeply negative min_arpu
--       -> real refund/chargeback disasters. That is signal.
--          REMOVE the GREATEST/LEAST wrapper in phase_1.
--   buckets a+b together are under ~0.1% of rows
--       -> immaterial either way. Keep the cap and move on.


-- ---------------------------------------------------------------------
-- 0.12  NEW -- percentiles on the 2024+ window
--       The winsorisation constants in Phase 1 came from the full
--       2022-2026 population. They must be re-derived.
-- ---------------------------------------------------------------------
SELECT
  COUNT(*)                                                     AS n,
  ROUND(AVG(bc4_net_ltv), 2)                                   AS mean_net_ltv,
  ROUND(APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(1)], 2)      AS net_ltv_p01,
  ROUND(APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(50)], 2)     AS net_ltv_median,
  ROUND(APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(99)], 2)     AS net_ltv_p99,
  ROUND(MIN(bc4_net_ltv), 2)                                   AS net_ltv_min,
  ROUND(MAX(bc4_net_ltv), 2)                                   AS net_ltv_max,
  ROUND(AVG(cum_net_arpu_thru_bc4), 2)                         AS mean_arpu,
  ROUND(APPROX_QUANTILES(cum_net_arpu_thru_bc4, 100)[OFFSET(1)], 2)  AS arpu_p01,
  ROUND(APPROX_QUANTILES(cum_net_arpu_thru_bc4, 100)[OFFSET(99)], 2) AS arpu_p99,
  ROUND(MIN(cum_net_arpu_thru_bc4), 2)                         AS arpu_min,
  ROUND(MAX(cum_net_arpu_thru_bc4), 2)                         AS arpu_max
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL
  AND acquisition_date >= '2024-01-01';

-- ACTION: put net_ltv_p01 and net_ltv_p99 into the GREATEST/LEAST
--         wrapper in phase_1 (both marked <<< TUNE).
--
-- ALSO WORTH SEEING: arpu_min. If it is not deeply negative, that
-- confirms the -5,028 outliers are CAC-driven and the ARPU model (View B)
-- is working on a much better-behaved target than the net-LTV model.
