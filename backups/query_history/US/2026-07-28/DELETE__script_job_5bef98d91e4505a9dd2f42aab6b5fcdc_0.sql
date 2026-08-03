-- job_id: script_job_5bef98d91e4505a9dd2f42aab6b5fcdc_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:02.658000+00:00
-- started: 2026-07-28T08:45:03.090000+00:00
-- ended: 2026-07-28T08:45:04.166000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
