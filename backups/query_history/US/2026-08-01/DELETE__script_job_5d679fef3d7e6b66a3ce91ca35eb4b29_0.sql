-- job_id: script_job_5d679fef3d7e6b66a3ce91ca35eb4b29_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T09:30:03.094000+00:00
-- started: 2026-08-01T09:30:03.499000+00:00
-- ended: 2026-08-01T09:30:05.999000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
