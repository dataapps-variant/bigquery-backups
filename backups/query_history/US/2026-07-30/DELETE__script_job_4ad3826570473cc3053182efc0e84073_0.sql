-- job_id: script_job_4ad3826570473cc3053182efc0e84073_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:00:07.006000+00:00
-- started: 2026-07-30T10:00:07.373000+00:00
-- ended: 2026-07-30T10:00:08.585000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
