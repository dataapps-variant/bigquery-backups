-- job_id: script_job_e839b6de3de554c32526532e8ac32308_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:30:03.268000+00:00
-- started: 2026-07-30T08:30:03.747000+00:00
-- ended: 2026-07-30T08:30:04.986000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
