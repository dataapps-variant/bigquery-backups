-- job_id: script_job_95554e3ea367e0241e1202240587fb37_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T09:45:04.717000+00:00
-- started: 2026-07-30T09:45:05.049000+00:00
-- ended: 2026-07-30T09:45:06.566000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
