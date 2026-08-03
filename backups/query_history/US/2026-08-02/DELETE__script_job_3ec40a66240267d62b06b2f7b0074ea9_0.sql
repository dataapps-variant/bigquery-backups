-- job_id: script_job_3ec40a66240267d62b06b2f7b0074ea9_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:01.779000+00:00
-- started: 2026-08-02T08:45:02.179000+00:00
-- ended: 2026-08-02T08:45:03.232000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
