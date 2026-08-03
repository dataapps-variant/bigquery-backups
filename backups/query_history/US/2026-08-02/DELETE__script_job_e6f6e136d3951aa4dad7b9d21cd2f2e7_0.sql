-- job_id: script_job_e6f6e136d3951aa4dad7b9d21cd2f2e7_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:03.486000+00:00
-- started: 2026-08-02T08:45:03.817000+00:00
-- ended: 2026-08-02T08:45:05.062000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
