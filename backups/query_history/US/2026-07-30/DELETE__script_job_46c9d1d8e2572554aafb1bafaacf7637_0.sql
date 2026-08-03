-- job_id: script_job_46c9d1d8e2572554aafb1bafaacf7637_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:45:05.846000+00:00
-- started: 2026-07-30T08:45:06.144000+00:00
-- ended: 2026-07-30T08:45:09.029000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
