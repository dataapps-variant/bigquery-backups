-- job_id: script_job_49bb42d916814f56becf417965d727d5_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T10:31:24.452000+00:00
-- started: 2026-07-29T10:31:24.739000+00:00
-- ended: 2026-07-29T10:31:25.819000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
