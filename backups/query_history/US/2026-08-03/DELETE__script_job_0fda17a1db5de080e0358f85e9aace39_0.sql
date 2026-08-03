-- job_id: script_job_0fda17a1db5de080e0358f85e9aace39_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:45:01.669000+00:00
-- started: 2026-08-03T08:45:02.030000+00:00
-- ended: 2026-08-03T08:45:03.117000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
