-- job_id: script_job_eb02ac6b9ddf04be77612bbb22f4ce96_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T15:18:42.567000+00:00
-- started: 2026-07-28T15:18:42.959000+00:00
-- ended: 2026-07-28T15:18:46.864000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
