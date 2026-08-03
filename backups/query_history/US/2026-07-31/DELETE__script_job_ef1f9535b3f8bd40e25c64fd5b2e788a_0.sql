-- job_id: script_job_ef1f9535b3f8bd40e25c64fd5b2e788a_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:03.981000+00:00
-- started: 2026-07-31T08:45:04.353000+00:00
-- ended: 2026-07-31T08:45:05.563000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
