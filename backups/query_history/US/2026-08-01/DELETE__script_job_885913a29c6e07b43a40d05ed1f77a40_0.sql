-- job_id: script_job_885913a29c6e07b43a40d05ed1f77a40_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T10:00:02.448000+00:00
-- started: 2026-08-01T10:00:03.059000+00:00
-- ended: 2026-08-01T10:00:04.248000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
