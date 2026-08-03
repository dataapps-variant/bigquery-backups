-- job_id: script_job_f1d347e0e83ec499eb328b524ac8a612_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T09:30:08.008000+00:00
-- started: 2026-07-30T09:30:08.485000+00:00
-- ended: 2026-07-30T09:30:10.039000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
