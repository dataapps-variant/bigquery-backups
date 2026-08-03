-- job_id: script_job_4a321dc0d2d25c254ecc69f66b77e643_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T09:15:03.073000+00:00
-- started: 2026-08-02T09:15:03.544000+00:00
-- ended: 2026-08-02T09:15:04.629000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
