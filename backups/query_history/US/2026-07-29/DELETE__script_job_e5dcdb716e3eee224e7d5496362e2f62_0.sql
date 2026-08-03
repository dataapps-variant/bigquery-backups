-- job_id: script_job_e5dcdb716e3eee224e7d5496362e2f62_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:45:03.552000+00:00
-- started: 2026-07-29T08:45:04.135000+00:00
-- ended: 2026-07-29T08:45:05.338000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
