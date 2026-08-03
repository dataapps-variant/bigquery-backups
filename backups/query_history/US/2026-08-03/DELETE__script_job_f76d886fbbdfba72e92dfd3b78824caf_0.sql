-- job_id: script_job_f76d886fbbdfba72e92dfd3b78824caf_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:45:01.682000+00:00
-- started: 2026-08-03T08:45:02.063000+00:00
-- ended: 2026-08-03T08:45:03.131000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
