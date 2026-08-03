-- job_id: script_job_9f1a34a3885b4d6d62ef24b4e194936b_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:45:03.893000+00:00
-- started: 2026-08-01T08:45:04.275000+00:00
-- ended: 2026-08-01T08:45:05.623000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
