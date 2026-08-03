-- job_id: script_job_0a7ec33cf8668beebb09812f42494d36_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:30:02.107000+00:00
-- started: 2026-07-28T08:30:02.420000+00:00
-- ended: 2026-07-28T08:30:04.553000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
