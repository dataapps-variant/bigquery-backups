-- job_id: script_job_afe90f629bf178a11f705457bc3ccbd9_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:30:03.806000+00:00
-- started: 2026-07-31T08:30:04.238000+00:00
-- ended: 2026-07-31T08:30:05.526000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
