-- job_id: script_job_c49f39d494d0806c9b19d819c82bfeac_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:45:04.132000+00:00
-- started: 2026-08-03T08:45:04.583000+00:00
-- ended: 2026-08-03T08:45:05.775000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
