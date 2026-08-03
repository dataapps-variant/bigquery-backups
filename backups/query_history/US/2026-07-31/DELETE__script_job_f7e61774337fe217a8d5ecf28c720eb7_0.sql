-- job_id: script_job_f7e61774337fe217a8d5ecf28c720eb7_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:04.622000+00:00
-- started: 2026-07-31T08:45:05.030000+00:00
-- ended: 2026-07-31T08:45:06.199000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
