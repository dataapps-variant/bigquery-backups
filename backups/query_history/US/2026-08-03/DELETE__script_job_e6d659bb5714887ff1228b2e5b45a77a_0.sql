-- job_id: script_job_e6d659bb5714887ff1228b2e5b45a77a_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T09:45:03.005000+00:00
-- started: 2026-08-03T09:45:03.510000+00:00
-- ended: 2026-08-03T09:45:05.323000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
