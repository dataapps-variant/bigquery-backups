-- job_id: script_job_04856190e22f25358d70feb5c4345e7d_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T09:45:08.069000+00:00
-- started: 2026-08-01T09:45:08.406000+00:00
-- ended: 2026-08-01T09:45:11.035000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
