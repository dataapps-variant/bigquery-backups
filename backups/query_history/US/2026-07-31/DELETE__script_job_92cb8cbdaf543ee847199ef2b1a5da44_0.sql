-- job_id: script_job_92cb8cbdaf543ee847199ef2b1a5da44_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T09:15:03.667000+00:00
-- started: 2026-07-31T09:15:04.005000+00:00
-- ended: 2026-07-31T09:15:05.083000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
