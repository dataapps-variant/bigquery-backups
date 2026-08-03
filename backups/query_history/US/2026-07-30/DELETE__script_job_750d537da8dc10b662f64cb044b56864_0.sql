-- job_id: script_job_750d537da8dc10b662f64cb044b56864_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:45:05.549000+00:00
-- started: 2026-07-30T08:45:05.975000+00:00
-- ended: 2026-07-30T08:45:07.322000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
