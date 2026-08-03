-- job_id: script_job_ef4b98a717a3ab9bba1a133a3b2c413a_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:30:01.615000+00:00
-- started: 2026-08-03T08:30:02.063000+00:00
-- ended: 2026-08-03T08:30:03.324000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
