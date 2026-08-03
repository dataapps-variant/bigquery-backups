-- job_id: script_job_fa6a8ada4b078d948b112cd215cae319_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:30:08.928000+00:00
-- started: 2026-08-01T08:30:09.277000+00:00
-- ended: 2026-08-01T08:30:11.356000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
