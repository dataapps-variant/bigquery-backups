-- job_id: script_job_4414f2beb00abf50ffc7bfd7568b0850_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T09:30:08.404000+00:00
-- started: 2026-08-02T09:30:08.840000+00:00
-- ended: 2026-08-02T09:30:10.008000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
