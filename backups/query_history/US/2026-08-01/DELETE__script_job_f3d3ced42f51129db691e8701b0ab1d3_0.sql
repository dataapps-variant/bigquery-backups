-- job_id: script_job_f3d3ced42f51129db691e8701b0ab1d3_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T09:15:02.018000+00:00
-- started: 2026-08-01T09:15:02.882000+00:00
-- ended: 2026-08-01T09:15:04.749000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
