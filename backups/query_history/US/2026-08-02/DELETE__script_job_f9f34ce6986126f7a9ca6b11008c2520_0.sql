-- job_id: script_job_f9f34ce6986126f7a9ca6b11008c2520_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:04.191000+00:00
-- started: 2026-08-02T08:45:04.594000+00:00
-- ended: 2026-08-02T08:45:05.770000+00:00

DELETE FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
