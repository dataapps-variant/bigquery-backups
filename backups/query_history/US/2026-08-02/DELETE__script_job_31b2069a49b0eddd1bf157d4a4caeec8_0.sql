-- job_id: script_job_31b2069a49b0eddd1bf157d4a4caeec8_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:30:04.382000+00:00
-- started: 2026-08-02T08:30:04.857000+00:00
-- ended: 2026-08-02T08:30:07.615000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
