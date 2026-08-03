-- job_id: script_job_f5505dc2397ef8251084d52bc38e91bd_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:31:28.674000+00:00
-- started: 2026-07-31T09:31:28.746000+00:00
-- ended: 2026-07-31T09:31:29.982000+00:00

SELECT
  COUNT(*)                                  AS immature_paid_rows,
  COUNTIF(cac IS NULL)                      AS null_cac,
  ROUND(100 * COUNTIF(cac IS NULL) / COUNT(*), 2) AS pct_null_cac,
  ROUND(AVG(cac), 2)                        AS avg_cac
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = FALSE
  AND NOT is_organic
