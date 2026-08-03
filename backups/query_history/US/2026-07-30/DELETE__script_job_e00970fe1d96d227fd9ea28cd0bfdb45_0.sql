-- job_id: script_job_e00970fe1d96d227fd9ea28cd0bfdb45_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:41:30.265000+00:00
-- started: 2026-07-30T10:41:31.075000+00:00
-- ended: 2026-07-30T10:41:32.423000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
