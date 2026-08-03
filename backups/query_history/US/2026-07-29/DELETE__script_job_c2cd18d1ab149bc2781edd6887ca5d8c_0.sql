-- job_id: script_job_c2cd18d1ab149bc2781edd6887ca5d8c_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T09:45:03.632000+00:00
-- started: 2026-07-29T09:45:03.990000+00:00
-- ended: 2026-07-29T09:45:05.224000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
