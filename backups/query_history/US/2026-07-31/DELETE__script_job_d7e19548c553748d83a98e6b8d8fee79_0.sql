-- job_id: script_job_d7e19548c553748d83a98e6b8d8fee79_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:03.902000+00:00
-- started: 2026-07-31T08:45:04.290000+00:00
-- ended: 2026-07-31T08:45:05.675000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
