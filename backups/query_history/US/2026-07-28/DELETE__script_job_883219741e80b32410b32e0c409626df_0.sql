-- job_id: script_job_883219741e80b32410b32e0c409626df_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T18:37:13.945000+00:00
-- started: 2026-07-28T18:37:14.318000+00:00
-- ended: 2026-07-28T18:37:15.925000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
