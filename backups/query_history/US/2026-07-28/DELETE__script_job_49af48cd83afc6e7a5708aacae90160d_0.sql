-- job_id: script_job_49af48cd83afc6e7a5708aacae90160d_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T18:07:52.582000+00:00
-- started: 2026-07-28T18:07:52.951000+00:00
-- ended: 2026-07-28T18:07:54.347000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
