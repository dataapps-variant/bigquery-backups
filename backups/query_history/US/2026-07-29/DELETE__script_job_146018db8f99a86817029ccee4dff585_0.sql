-- job_id: script_job_146018db8f99a86817029ccee4dff585_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T09:51:34.004000+00:00
-- started: 2026-07-29T09:51:34.420000+00:00
-- ended: 2026-07-29T09:51:36.127000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
