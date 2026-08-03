-- job_id: script_job_9c150b6a51b5bf9add7ea588f8d49333_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:01.673000+00:00
-- started: 2026-07-28T08:45:01.968000+00:00
-- ended: 2026-07-28T08:45:02.966000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
