-- job_id: script_job_977acbbb7ca06acbc75a5ed4ae278085_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:45:03.411000+00:00
-- started: 2026-08-03T08:45:03.937000+00:00
-- ended: 2026-08-03T08:45:05.164000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
