-- job_id: script_job_90a287934a116dd049344409571fb109_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T09:15:04.255000+00:00
-- started: 2026-08-03T09:15:04.705000+00:00
-- ended: 2026-08-03T09:15:06.453000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
