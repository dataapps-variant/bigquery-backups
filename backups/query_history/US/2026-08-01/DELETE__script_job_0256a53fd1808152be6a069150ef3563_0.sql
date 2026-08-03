-- job_id: script_job_0256a53fd1808152be6a069150ef3563_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:45:06.839000+00:00
-- started: 2026-08-01T08:45:07.171000+00:00
-- ended: 2026-08-01T08:45:08.316000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
