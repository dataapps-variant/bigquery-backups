-- job_id: script_job_c9a257f474004a929f986ac247cc3f2c_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T09:15:02.152000+00:00
-- started: 2026-07-31T09:15:03.129000+00:00
-- ended: 2026-07-31T09:15:04.309000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
