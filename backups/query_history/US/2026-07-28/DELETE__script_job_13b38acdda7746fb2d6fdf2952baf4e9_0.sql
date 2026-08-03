-- job_id: script_job_13b38acdda7746fb2d6fdf2952baf4e9_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:30:10.148000+00:00
-- started: 2026-07-28T08:30:10.514000+00:00
-- ended: 2026-07-28T08:30:11.851000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
