-- job_id: script_job_66443dddfa0ba53d0725d1400ded634c_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:45:06.617000+00:00
-- started: 2026-08-01T08:45:06.918000+00:00
-- ended: 2026-08-01T08:45:08.267000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
