-- job_id: script_job_af3deb05debcc3350773b65d1015de25_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T09:15:06.134000+00:00
-- started: 2026-08-03T09:15:06.493000+00:00
-- ended: 2026-08-03T09:15:07.872000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
