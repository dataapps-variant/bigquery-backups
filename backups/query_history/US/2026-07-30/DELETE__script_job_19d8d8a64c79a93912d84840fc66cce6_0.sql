-- job_id: script_job_19d8d8a64c79a93912d84840fc66cce6_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:30:05.301000+00:00
-- started: 2026-07-30T08:30:05.672000+00:00
-- ended: 2026-07-30T08:30:06.819000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
