-- job_id: script_job_6692a01f3e6222c0e6213605488dd88e_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:02.767000+00:00
-- started: 2026-07-28T08:45:03.103000+00:00
-- ended: 2026-07-28T08:45:04.473000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
