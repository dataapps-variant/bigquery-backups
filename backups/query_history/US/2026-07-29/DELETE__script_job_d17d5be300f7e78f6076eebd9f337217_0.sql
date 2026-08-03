-- job_id: script_job_d17d5be300f7e78f6076eebd9f337217_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T09:34:27.467000+00:00
-- started: 2026-07-29T09:34:27.950000+00:00
-- ended: 2026-07-29T09:34:29.168000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
