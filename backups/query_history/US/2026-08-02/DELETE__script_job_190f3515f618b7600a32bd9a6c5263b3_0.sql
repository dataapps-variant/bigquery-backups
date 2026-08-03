-- job_id: script_job_190f3515f618b7600a32bd9a6c5263b3_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T09:45:03.505000+00:00
-- started: 2026-08-02T09:45:03.805000+00:00
-- ended: 2026-08-02T09:45:04.925000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
