-- job_id: script_job_ce3b078134e69b24f5e14dd0cd075bb3_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:45:01.823000+00:00
-- started: 2026-07-29T08:45:02.316000+00:00
-- ended: 2026-07-29T08:45:03.596000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
