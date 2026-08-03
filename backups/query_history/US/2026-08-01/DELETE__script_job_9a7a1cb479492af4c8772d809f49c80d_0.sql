-- job_id: script_job_9a7a1cb479492af4c8772d809f49c80d_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T09:15:05.729000+00:00
-- started: 2026-08-01T09:15:06.154000+00:00
-- ended: 2026-08-01T09:15:08.261000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
