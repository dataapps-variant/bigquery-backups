-- job_id: script_job_fd8039c5be9a9646cf326b3f661556c4_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T09:30:03.697000+00:00
-- started: 2026-07-28T09:30:04.162000+00:00
-- ended: 2026-07-28T09:30:05.444000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
