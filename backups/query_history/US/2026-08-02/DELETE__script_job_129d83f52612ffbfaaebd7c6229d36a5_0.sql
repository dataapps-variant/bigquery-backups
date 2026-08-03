-- job_id: script_job_129d83f52612ffbfaaebd7c6229d36a5_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:04.246000+00:00
-- started: 2026-08-02T08:45:04.633000+00:00
-- ended: 2026-08-02T08:45:12.701000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
