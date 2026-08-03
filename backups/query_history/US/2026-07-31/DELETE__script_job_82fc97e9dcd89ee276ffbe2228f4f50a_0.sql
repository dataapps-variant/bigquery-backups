-- job_id: script_job_82fc97e9dcd89ee276ffbe2228f4f50a_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:05.849000+00:00
-- started: 2026-07-31T08:45:06.144000+00:00
-- ended: 2026-07-31T08:45:07.279000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
