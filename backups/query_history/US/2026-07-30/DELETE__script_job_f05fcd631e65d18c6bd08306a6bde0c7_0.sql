-- job_id: script_job_f05fcd631e65d18c6bd08306a6bde0c7_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:13:31.184000+00:00
-- started: 2026-07-30T10:13:31.820000+00:00
-- ended: 2026-07-30T10:13:34.442000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
