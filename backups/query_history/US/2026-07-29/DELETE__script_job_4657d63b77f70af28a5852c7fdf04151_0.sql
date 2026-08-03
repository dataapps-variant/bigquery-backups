-- job_id: script_job_4657d63b77f70af28a5852c7fdf04151_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T10:00:11.510000+00:00
-- started: 2026-07-29T10:00:11.873000+00:00
-- ended: 2026-07-29T10:00:13.179000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
