-- job_id: script_job_ff232b9c19fd636a868d13860ef616af_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T09:15:02.975000+00:00
-- started: 2026-08-03T09:15:03.513000+00:00
-- ended: 2026-08-03T09:15:05.483000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
