-- job_id: script_job_06811e4f9f764788499f9a279c936146_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:45:03.270000+00:00
-- started: 2026-07-30T08:45:03.720000+00:00
-- ended: 2026-07-30T08:45:06.468000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
