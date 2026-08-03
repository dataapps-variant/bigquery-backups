-- job_id: script_job_9a09eb3550ec226dd43348cd2b431781_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T16:31:46.342000+00:00
-- started: 2026-07-28T16:31:46.672000+00:00
-- ended: 2026-07-28T16:31:47.713000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
