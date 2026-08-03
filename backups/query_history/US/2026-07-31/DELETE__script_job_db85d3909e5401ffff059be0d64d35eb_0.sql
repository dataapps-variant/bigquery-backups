-- job_id: script_job_db85d3909e5401ffff059be0d64d35eb_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T10:00:03.991000+00:00
-- started: 2026-07-31T10:00:04.488000+00:00
-- ended: 2026-07-31T10:00:05.788000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
