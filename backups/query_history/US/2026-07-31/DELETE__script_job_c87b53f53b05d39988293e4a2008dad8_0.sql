-- job_id: script_job_c87b53f53b05d39988293e4a2008dad8_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:03.426000+00:00
-- started: 2026-07-31T08:45:03.779000+00:00
-- ended: 2026-07-31T08:45:04.932000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
