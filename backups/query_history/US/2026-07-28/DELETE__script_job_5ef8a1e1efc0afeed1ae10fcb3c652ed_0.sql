-- job_id: script_job_5ef8a1e1efc0afeed1ae10fcb3c652ed_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T15:10:17.291000+00:00
-- started: 2026-07-28T15:10:17.838000+00:00
-- ended: 2026-07-28T15:10:19.206000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
