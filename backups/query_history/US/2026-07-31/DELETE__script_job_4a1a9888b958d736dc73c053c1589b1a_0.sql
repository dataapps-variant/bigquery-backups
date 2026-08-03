-- job_id: script_job_4a1a9888b958d736dc73c053c1589b1a_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:30:03.135000+00:00
-- started: 2026-07-31T08:30:03.458000+00:00
-- ended: 2026-07-31T08:30:04.643000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
