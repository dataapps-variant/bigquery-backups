-- job_id: script_job_af9b8e45537b50206782510029689c52_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:03.481000+00:00
-- started: 2026-07-28T08:45:03.948000+00:00
-- ended: 2026-07-28T08:45:05.894000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
