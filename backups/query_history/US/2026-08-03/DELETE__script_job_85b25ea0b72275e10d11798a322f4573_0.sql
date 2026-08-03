-- job_id: script_job_85b25ea0b72275e10d11798a322f4573_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:45:01.537000+00:00
-- started: 2026-08-03T08:45:01.915000+00:00
-- ended: 2026-08-03T08:45:03.030000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
