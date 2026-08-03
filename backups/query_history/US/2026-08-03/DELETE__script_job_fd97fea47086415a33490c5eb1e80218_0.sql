-- job_id: script_job_fd97fea47086415a33490c5eb1e80218_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:30:06.204000+00:00
-- started: 2026-08-03T08:30:06.669000+00:00
-- ended: 2026-08-03T08:30:09.041000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
