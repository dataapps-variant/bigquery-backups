-- job_id: script_job_f006c1c3e568e64f5f4a4a5ee8337e64_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:45:03.579000+00:00
-- started: 2026-07-29T08:45:04.167000+00:00
-- ended: 2026-07-29T08:45:06.829000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
