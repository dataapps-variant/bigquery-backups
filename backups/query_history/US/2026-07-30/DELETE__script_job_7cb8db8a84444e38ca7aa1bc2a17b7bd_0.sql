-- job_id: script_job_7cb8db8a84444e38ca7aa1bc2a17b7bd_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:30:05.998000+00:00
-- started: 2026-07-30T08:30:06.500000+00:00
-- ended: 2026-07-30T08:30:07.705000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
