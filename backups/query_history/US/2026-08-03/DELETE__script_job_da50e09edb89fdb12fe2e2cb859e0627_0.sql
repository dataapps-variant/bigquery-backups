-- job_id: script_job_da50e09edb89fdb12fe2e2cb859e0627_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T09:45:02.018000+00:00
-- started: 2026-08-03T09:45:02.463000+00:00
-- ended: 2026-08-03T09:45:03.652000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
