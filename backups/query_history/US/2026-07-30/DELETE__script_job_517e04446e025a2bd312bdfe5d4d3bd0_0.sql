-- job_id: script_job_517e04446e025a2bd312bdfe5d4d3bd0_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:45:02.374000+00:00
-- started: 2026-07-30T08:45:02.779000+00:00
-- ended: 2026-07-30T08:45:04.001000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
