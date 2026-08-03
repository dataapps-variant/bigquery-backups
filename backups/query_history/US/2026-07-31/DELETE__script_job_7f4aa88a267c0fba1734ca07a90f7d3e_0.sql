-- job_id: script_job_7f4aa88a267c0fba1734ca07a90f7d3e_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:03.043000+00:00
-- started: 2026-07-31T08:45:03.436000+00:00
-- ended: 2026-07-31T08:45:04.454000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
