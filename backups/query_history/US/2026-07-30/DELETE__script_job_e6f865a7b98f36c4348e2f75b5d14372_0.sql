-- job_id: script_job_e6f865a7b98f36c4348e2f75b5d14372_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:45:05.627000+00:00
-- started: 2026-07-30T08:45:05.985000+00:00
-- ended: 2026-07-30T08:45:07.087000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
