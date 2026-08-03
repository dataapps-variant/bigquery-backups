-- job_id: script_job_d53d4a12ad9d807ea558d4c0e6a975b0_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:45:03.477000+00:00
-- started: 2026-07-29T08:45:04.171000+00:00
-- ended: 2026-07-29T08:45:07.306000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
