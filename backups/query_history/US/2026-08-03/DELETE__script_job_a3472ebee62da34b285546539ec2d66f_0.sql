-- job_id: script_job_a3472ebee62da34b285546539ec2d66f_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T09:30:04.629000+00:00
-- started: 2026-08-03T09:30:05.047000+00:00
-- ended: 2026-08-03T09:30:08.363000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
