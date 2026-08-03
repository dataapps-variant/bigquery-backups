-- job_id: script_job_1998b7a75627b6d2a90cda87e8acf950_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:22:54.495000+00:00
-- started: 2026-07-31T09:22:54.566000+00:00
-- ended: 2026-07-31T09:22:56.445000+00:00

SELECT
  COUNT(*)                                        AS n,
  ROUND(AVG(bc4_net_ltv), 2)                      AS mean_ltv,
  ROUND(STDDEV(bc4_net_ltv), 2)                   AS stddev_ltv,
  ROUND(MIN(bc4_net_ltv), 2)                      AS min_ltv,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(1)]   AS p01,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(25)]  AS p25,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(50)]  AS median,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(75)]  AS p75,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(99)]  AS p99,
  ROUND(MAX(bc4_net_ltv), 2)                      AS max_ltv,
  COUNTIF(bc4_net_ltv < 0)                        AS negative_ltv_rows
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL
