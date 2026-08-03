-- job_id: script_job_b40d2145787c71fea2f6fbb9057ace37_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:03.561000+00:00
-- started: 2026-07-28T08:45:03.907000+00:00
-- ended: 2026-07-28T08:45:05.224000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
