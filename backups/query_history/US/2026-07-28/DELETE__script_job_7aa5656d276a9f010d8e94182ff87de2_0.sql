-- job_id: script_job_7aa5656d276a9f010d8e94182ff87de2_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:30:05.006000+00:00
-- started: 2026-07-28T08:30:05.343000+00:00
-- ended: 2026-07-28T08:30:07.124000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
