-- job_id: script_job_c04173e4eef8f41eb5db35e1a50852a6_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T09:45:02.714000+00:00
-- started: 2026-08-02T09:45:03.206000+00:00
-- ended: 2026-08-02T09:45:04.394000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
