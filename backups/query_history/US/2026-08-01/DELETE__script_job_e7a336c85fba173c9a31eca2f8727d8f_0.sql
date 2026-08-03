-- job_id: script_job_e7a336c85fba173c9a31eca2f8727d8f_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:30:03.171000+00:00
-- started: 2026-08-01T08:30:03.506000+00:00
-- ended: 2026-08-01T08:30:04.706000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
