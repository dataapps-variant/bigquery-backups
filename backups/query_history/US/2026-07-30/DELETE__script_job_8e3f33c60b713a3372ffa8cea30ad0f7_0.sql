-- job_id: script_job_8e3f33c60b713a3372ffa8cea30ad0f7_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:30:04.232000+00:00
-- started: 2026-07-30T08:30:04.540000+00:00
-- ended: 2026-07-30T08:30:07.208000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
