-- job_id: script_job_3af86230f56b72e7db89ff914bdb8109_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:01.649000+00:00
-- started: 2026-07-28T08:45:02.071000+00:00
-- ended: 2026-07-28T08:45:03.392000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
