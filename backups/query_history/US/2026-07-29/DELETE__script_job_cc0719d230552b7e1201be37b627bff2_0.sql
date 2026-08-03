-- job_id: script_job_cc0719d230552b7e1201be37b627bff2_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T09:50:31.505000+00:00
-- started: 2026-07-29T09:50:31.907000+00:00
-- ended: 2026-07-29T09:50:34.557000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
