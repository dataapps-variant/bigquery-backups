-- job_id: script_job_ea45e96a9776c1ce69f162b9cf889137_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T09:45:04.153000+00:00
-- started: 2026-08-03T09:45:04.622000+00:00
-- ended: 2026-08-03T09:45:05.765000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
