-- job_id: script_job_6c74398533bae79e44319441a394df6b_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:03.813000+00:00
-- started: 2026-08-02T08:45:04.244000+00:00
-- ended: 2026-08-02T08:45:05.518000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
