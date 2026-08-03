-- job_id: script_job_b060cd3ba8c065b82baebb943d41c4d8_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:30:05.200000+00:00
-- started: 2026-07-29T08:30:05.649000+00:00
-- ended: 2026-07-29T08:30:08.155000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
