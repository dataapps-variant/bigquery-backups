-- job_id: script_job_f1a5a6bd2eab3936072c4a5ea6ae611b_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:45:03.657000+00:00
-- started: 2026-07-28T08:45:04.081000+00:00
-- ended: 2026-07-28T08:45:05.168000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
