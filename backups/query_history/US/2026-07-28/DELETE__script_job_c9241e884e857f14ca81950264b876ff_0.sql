-- job_id: script_job_c9241e884e857f14ca81950264b876ff_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T09:45:04.464000+00:00
-- started: 2026-07-28T09:45:04.749000+00:00
-- ended: 2026-07-28T09:45:05.957000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
