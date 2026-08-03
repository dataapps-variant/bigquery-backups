-- job_id: script_job_54be4346bdbe035e77baa532831dd28b_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:45:01.857000+00:00
-- started: 2026-08-03T08:45:02.164000+00:00
-- ended: 2026-08-03T08:45:03.136000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
