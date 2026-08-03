-- job_id: script_job_8337ea5777f2e8cfc28dee458b83e4bc_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T09:15:01.926000+00:00
-- started: 2026-08-01T09:15:02.255000+00:00
-- ended: 2026-08-01T09:15:04.677000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
