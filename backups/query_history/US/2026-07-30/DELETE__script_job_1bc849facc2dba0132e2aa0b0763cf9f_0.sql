-- job_id: script_job_1bc849facc2dba0132e2aa0b0763cf9f_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:45:04.064000+00:00
-- started: 2026-07-30T08:45:04.394000+00:00
-- ended: 2026-07-30T08:45:07.268000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
