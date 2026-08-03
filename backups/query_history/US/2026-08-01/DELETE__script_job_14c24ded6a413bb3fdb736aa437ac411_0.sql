-- job_id: script_job_14c24ded6a413bb3fdb736aa437ac411_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:45:05.369000+00:00
-- started: 2026-08-01T08:45:05.677000+00:00
-- ended: 2026-08-01T08:45:06.837000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
