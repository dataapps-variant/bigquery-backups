-- job_id: script_job_73b2c237367478612762c08bd8cea3f9_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T09:45:04.933000+00:00
-- started: 2026-07-31T09:45:05.420000+00:00
-- ended: 2026-07-31T09:45:06.692000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
