-- job_id: script_job_5e9e31d8b55da3f405d487c7b38140d3_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:45:02.251000+00:00
-- started: 2026-08-01T08:45:02.703000+00:00
-- ended: 2026-08-01T08:45:04.444000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
