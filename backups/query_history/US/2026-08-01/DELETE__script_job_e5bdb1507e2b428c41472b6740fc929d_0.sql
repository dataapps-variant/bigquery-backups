-- job_id: script_job_e5bdb1507e2b428c41472b6740fc929d_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T09:45:08.563000+00:00
-- started: 2026-08-01T09:45:09.020000+00:00
-- ended: 2026-08-01T09:45:10.126000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
