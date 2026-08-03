-- job_id: script_job_af26aea0bb5af9f0546c2f96adbb5cf3_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:03.079000+00:00
-- started: 2026-07-31T08:45:03.542000+00:00
-- ended: 2026-07-31T08:45:04.634000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
