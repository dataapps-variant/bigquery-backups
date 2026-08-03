-- job_id: script_job_4625ac53b822a7c6036b4044420b82fb_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:04.101000+00:00
-- started: 2026-07-31T08:45:04.414000+00:00
-- ended: 2026-07-31T08:45:05.505000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
