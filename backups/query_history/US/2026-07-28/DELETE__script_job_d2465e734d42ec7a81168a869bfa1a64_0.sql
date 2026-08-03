-- job_id: script_job_d2465e734d42ec7a81168a869bfa1a64_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:04.452000+00:00
-- started: 2026-07-28T08:45:04.870000+00:00
-- ended: 2026-07-28T08:45:06.014000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
