-- job_id: script_job_763f816a71f8b2d3d3198dd5ad412b51_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:45:02.867000+00:00
-- started: 2026-07-29T08:45:03.265000+00:00
-- ended: 2026-07-29T08:45:06.215000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
