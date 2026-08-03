-- job_id: script_job_70947f547fd52e578c4216a3b41d2ac3_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:45:03.049000+00:00
-- started: 2026-07-30T08:45:03.429000+00:00
-- ended: 2026-07-30T08:45:06.048000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
