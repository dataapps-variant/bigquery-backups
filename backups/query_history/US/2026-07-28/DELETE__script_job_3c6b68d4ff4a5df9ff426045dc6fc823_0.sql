-- job_id: script_job_3c6b68d4ff4a5df9ff426045dc6fc823_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:01.585000+00:00
-- started: 2026-07-28T08:45:01.899000+00:00
-- ended: 2026-07-28T08:45:03.038000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
