-- job_id: script_job_84ea3af30a7be16ad80b676b65e61eed_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T09:30:03.662000+00:00
-- started: 2026-07-29T09:30:04.060000+00:00
-- ended: 2026-07-29T09:30:05.119000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
