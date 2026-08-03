-- job_id: script_job_9622c04ab12e19d515a6cecbadb5f44f_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T09:45:05.952000+00:00
-- started: 2026-07-30T09:45:06.345000+00:00
-- ended: 2026-07-30T09:45:07.741000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
