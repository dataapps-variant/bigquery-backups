-- job_id: script_job_15f9587d8ecda733316a0106ad837f3d_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:30:03.320000+00:00
-- started: 2026-07-31T08:30:03.659000+00:00
-- ended: 2026-07-31T08:30:04.851000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
