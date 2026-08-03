-- job_id: script_job_902e2ef4ff22980d889f299b679703bd_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:30:08.282000+00:00
-- started: 2026-07-29T08:30:08.621000+00:00
-- ended: 2026-07-29T08:30:10.133000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
