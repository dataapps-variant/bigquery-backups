-- job_id: script_job_f9090825f0d510426926a662c8d77cad_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T09:45:07.197000+00:00
-- started: 2026-08-01T09:45:07.587000+00:00
-- ended: 2026-08-01T09:45:08.658000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
