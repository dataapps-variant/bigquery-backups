-- job_id: script_job_60b8eabe3a3eebe2f1398aecec9ab9fb_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:30:01.917000+00:00
-- started: 2026-08-03T08:30:02.698000+00:00
-- ended: 2026-08-03T08:30:03.842000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
