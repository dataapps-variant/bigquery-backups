-- job_id: script_job_7855fdd10fe5f93484221a74a7cb8aea_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:01.528000+00:00
-- started: 2026-08-02T08:45:01.898000+00:00
-- ended: 2026-08-02T08:45:03.008000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
