-- job_id: script_job_6730d151e0518f3b518267d7e27152d8_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T17:17:04.947000+00:00
-- started: 2026-07-28T17:17:05.335000+00:00
-- ended: 2026-07-28T17:17:07.617000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
