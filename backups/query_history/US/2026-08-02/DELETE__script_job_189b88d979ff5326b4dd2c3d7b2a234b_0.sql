-- job_id: script_job_189b88d979ff5326b4dd2c3d7b2a234b_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:30:06.645000+00:00
-- started: 2026-08-02T08:30:07.061000+00:00
-- ended: 2026-08-02T08:30:08.312000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
