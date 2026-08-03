-- job_id: script_job_225f1d1dea39e90ff32e055a325d1097_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:04.569000+00:00
-- started: 2026-07-31T08:45:04.929000+00:00
-- ended: 2026-07-31T08:45:06.012000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
