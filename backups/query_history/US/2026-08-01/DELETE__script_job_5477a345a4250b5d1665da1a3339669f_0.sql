-- job_id: script_job_5477a345a4250b5d1665da1a3339669f_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:30:08.599000+00:00
-- started: 2026-08-01T08:30:09.030000+00:00
-- ended: 2026-08-01T08:30:11.733000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
