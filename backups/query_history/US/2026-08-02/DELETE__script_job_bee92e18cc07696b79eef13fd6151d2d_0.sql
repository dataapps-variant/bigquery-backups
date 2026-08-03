-- job_id: script_job_bee92e18cc07696b79eef13fd6151d2d_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:30:04.664000+00:00
-- started: 2026-08-02T08:30:05.055000+00:00
-- ended: 2026-08-02T08:30:06.844000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
