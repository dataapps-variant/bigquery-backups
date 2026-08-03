-- job_id: script_job_394c8b20f4126fabc32b3d81b4f29299_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T09:45:08.266000+00:00
-- started: 2026-07-30T09:45:08.632000+00:00
-- ended: 2026-07-30T09:45:10.178000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
