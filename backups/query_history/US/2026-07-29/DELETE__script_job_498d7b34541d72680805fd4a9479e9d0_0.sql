-- job_id: script_job_498d7b34541d72680805fd4a9479e9d0_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T09:45:04.283000+00:00
-- started: 2026-07-29T09:45:04.582000+00:00
-- ended: 2026-07-29T09:45:05.769000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
