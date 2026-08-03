-- job_id: script_job_1c13edfa44cb1702d6b3a8afbfc2c29b_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T09:30:05.181000+00:00
-- started: 2026-07-31T09:30:05.635000+00:00
-- ended: 2026-07-31T09:30:07.145000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
