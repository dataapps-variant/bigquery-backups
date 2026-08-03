-- job_id: script_job_5eb35d25d4faf0e245dd330430441e6e_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:45:03.346000+00:00
-- started: 2026-08-03T08:45:03.733000+00:00
-- ended: 2026-08-03T08:45:07.188000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
