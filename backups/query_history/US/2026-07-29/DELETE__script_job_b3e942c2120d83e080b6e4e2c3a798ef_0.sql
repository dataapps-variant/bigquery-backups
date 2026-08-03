-- job_id: script_job_b3e942c2120d83e080b6e4e2c3a798ef_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:45:02.752000+00:00
-- started: 2026-07-29T08:45:03.183000+00:00
-- ended: 2026-07-29T08:45:04.447000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
