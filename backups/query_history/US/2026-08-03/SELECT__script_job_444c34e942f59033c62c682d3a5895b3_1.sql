-- job_id: script_job_444c34e942f59033c62c682d3a5895b3_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:04:24.041000+00:00
-- started: 2026-08-03T08:04:24.184000+00:00
-- ended: 2026-08-03T08:04:25.093000+00:00

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
  AND acquisition_date >= '2024-01-01'
