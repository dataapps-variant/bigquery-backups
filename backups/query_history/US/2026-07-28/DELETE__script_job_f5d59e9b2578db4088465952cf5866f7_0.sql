-- job_id: script_job_f5d59e9b2578db4088465952cf5866f7_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T10:00:02.921000+00:00
-- started: 2026-07-28T10:00:03.389000+00:00
-- ended: 2026-07-28T10:00:04.924000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
