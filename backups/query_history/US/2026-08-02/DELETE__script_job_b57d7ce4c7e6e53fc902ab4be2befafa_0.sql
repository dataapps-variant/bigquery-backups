-- job_id: script_job_b57d7ce4c7e6e53fc902ab4be2befafa_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T09:15:03.814000+00:00
-- started: 2026-08-02T09:15:04.177000+00:00
-- ended: 2026-08-02T09:15:05.328000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
