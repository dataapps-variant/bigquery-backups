-- job_id: script_job_e430b927b405c7fccb1ac6fe6014f7b5_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:23:04.755000+00:00
-- started: 2026-07-31T09:23:04.871000+00:00
-- ended: 2026-07-31T09:23:06.262000+00:00

SELECT
  COUNT(*)                                                          AS total,
  COUNTIF(ABS(bc4_net_ltv - (cum_net_arpu_thru_bc4 - cac)) < 0.01)  AS matches_arpu_minus_cac,
  COUNTIF(ABS(bc4_net_ltv - cum_net_arpu_thru_bc4) < 0.01)          AS matches_arpu_only,
  COUNTIF(cac IS NULL)                                              AS null_cac
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL
