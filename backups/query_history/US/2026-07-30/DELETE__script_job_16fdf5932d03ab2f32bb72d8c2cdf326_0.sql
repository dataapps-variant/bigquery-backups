-- job_id: script_job_16fdf5932d03ab2f32bb72d8c2cdf326_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:45:05.503000+00:00
-- started: 2026-07-30T08:45:05.898000+00:00
-- ended: 2026-07-30T08:45:07.319000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
