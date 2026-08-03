-- job_id: script_job_aa73c73b139a02393ed877577dbe137b_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T09:45:05.521000+00:00
-- started: 2026-07-31T09:45:05.858000+00:00
-- ended: 2026-07-31T09:45:07.035000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
