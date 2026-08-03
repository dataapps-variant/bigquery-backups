-- job_id: script_job_1f8ca52313e84a77dcc074e98e68f363_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:45:03.065000+00:00
-- started: 2026-08-01T08:45:03.401000+00:00
-- ended: 2026-08-01T08:45:04.433000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
