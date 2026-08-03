-- job_id: script_job_6b6bf26fd609658985809f541786a219_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T18:28:15.618000+00:00
-- started: 2026-07-28T18:28:16.014000+00:00
-- ended: 2026-07-28T18:28:17.645000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
