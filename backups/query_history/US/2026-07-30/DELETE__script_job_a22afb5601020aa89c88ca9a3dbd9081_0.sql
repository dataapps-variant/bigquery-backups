-- job_id: script_job_a22afb5601020aa89c88ca9a3dbd9081_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:52:28.579000+00:00
-- started: 2026-07-30T10:52:28.890000+00:00
-- ended: 2026-07-30T10:52:30.252000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
