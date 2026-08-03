-- job_id: script_job_1944098c089fe51fd848cc9c7655215c_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T18:29:33.270000+00:00
-- started: 2026-07-28T18:29:33.778000+00:00
-- ended: 2026-07-28T18:29:35.593000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
