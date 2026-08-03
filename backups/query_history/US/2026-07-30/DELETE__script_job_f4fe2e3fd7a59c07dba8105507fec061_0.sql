-- job_id: script_job_f4fe2e3fd7a59c07dba8105507fec061_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:19:06.719000+00:00
-- started: 2026-07-30T10:19:07.064000+00:00
-- ended: 2026-07-30T10:19:10.201000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
