-- job_id: script_job_d6c5107f2ee45a3e52a8cbba209caf35_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:04.813000+00:00
-- started: 2026-07-31T08:45:05.204000+00:00
-- ended: 2026-07-31T08:45:06.221000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
