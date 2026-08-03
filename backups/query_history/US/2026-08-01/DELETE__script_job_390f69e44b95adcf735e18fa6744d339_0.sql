-- job_id: script_job_390f69e44b95adcf735e18fa6744d339_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T09:15:05.534000+00:00
-- started: 2026-08-01T09:15:05.896000+00:00
-- ended: 2026-08-01T09:15:07.622000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
