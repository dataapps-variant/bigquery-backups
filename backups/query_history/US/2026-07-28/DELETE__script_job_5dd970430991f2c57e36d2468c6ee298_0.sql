-- job_id: script_job_5dd970430991f2c57e36d2468c6ee298_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T17:33:45.352000+00:00
-- started: 2026-07-28T17:33:45.693000+00:00
-- ended: 2026-07-28T17:33:47.548000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
