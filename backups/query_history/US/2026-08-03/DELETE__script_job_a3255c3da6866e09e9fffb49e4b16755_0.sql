-- job_id: script_job_a3255c3da6866e09e9fffb49e4b16755_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:45:02.601000+00:00
-- started: 2026-08-03T08:45:02.888000+00:00
-- ended: 2026-08-03T08:45:03.912000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
