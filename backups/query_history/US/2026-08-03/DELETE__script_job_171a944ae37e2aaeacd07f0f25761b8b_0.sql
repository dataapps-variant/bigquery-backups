-- job_id: script_job_171a944ae37e2aaeacd07f0f25761b8b_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:30:01.682000+00:00
-- started: 2026-08-03T08:30:02.054000+00:00
-- ended: 2026-08-03T08:30:03.638000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
