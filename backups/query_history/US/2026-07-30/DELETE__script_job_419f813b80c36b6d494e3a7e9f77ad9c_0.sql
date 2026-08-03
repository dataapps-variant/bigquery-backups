-- job_id: script_job_419f813b80c36b6d494e3a7e9f77ad9c_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T10:59:35.210000+00:00
-- started: 2026-07-30T10:59:35.592000+00:00
-- ended: 2026-07-30T10:59:38.274000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
