-- job_id: script_job_0be29cccdcbf9b60f39b7065c50e2de5_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T09:15:05.010000+00:00
-- started: 2026-08-03T09:15:05.643000+00:00
-- ended: 2026-08-03T09:15:07.371000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
