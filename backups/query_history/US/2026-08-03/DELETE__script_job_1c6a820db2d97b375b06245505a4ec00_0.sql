-- job_id: script_job_1c6a820db2d97b375b06245505a4ec00_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:45:05.975000+00:00
-- started: 2026-08-03T08:45:06.257000+00:00
-- ended: 2026-08-03T08:45:07.467000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
