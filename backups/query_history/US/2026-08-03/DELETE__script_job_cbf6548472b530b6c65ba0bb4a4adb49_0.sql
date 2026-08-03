-- job_id: script_job_cbf6548472b530b6c65ba0bb4a4adb49_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:45:01.758000+00:00
-- started: 2026-08-03T08:45:02.202000+00:00
-- ended: 2026-08-03T08:45:03.542000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
