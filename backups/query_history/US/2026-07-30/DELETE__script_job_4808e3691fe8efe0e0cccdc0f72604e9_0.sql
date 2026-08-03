-- job_id: script_job_4808e3691fe8efe0e0cccdc0f72604e9_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:58:20.594000+00:00
-- started: 2026-07-30T10:58:20.858000+00:00
-- ended: 2026-07-30T10:58:22.637000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
