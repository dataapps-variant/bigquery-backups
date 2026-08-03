-- job_id: script_job_84b2db0511db942bd6751467fdff3a60_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T10:32:34.611000+00:00
-- started: 2026-07-29T10:32:35.073000+00:00
-- ended: 2026-07-29T10:32:37.666000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
