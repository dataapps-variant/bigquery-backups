-- job_id: script_job_0b142424a1b1a3d05d44a7a5fe3a1f2c_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:02.255000+00:00
-- started: 2026-07-28T08:45:02.556000+00:00
-- ended: 2026-07-28T08:45:03.655000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
