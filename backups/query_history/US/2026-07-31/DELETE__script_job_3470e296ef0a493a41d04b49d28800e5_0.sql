-- job_id: script_job_3470e296ef0a493a41d04b49d28800e5_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:03.430000+00:00
-- started: 2026-07-31T08:45:03.791000+00:00
-- ended: 2026-07-31T08:45:04.867000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
