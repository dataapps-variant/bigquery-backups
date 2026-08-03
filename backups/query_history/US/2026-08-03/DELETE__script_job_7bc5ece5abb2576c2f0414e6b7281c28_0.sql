-- job_id: script_job_7bc5ece5abb2576c2f0414e6b7281c28_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:45:01.552000+00:00
-- started: 2026-08-03T08:45:01.835000+00:00
-- ended: 2026-08-03T08:45:02.943000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
