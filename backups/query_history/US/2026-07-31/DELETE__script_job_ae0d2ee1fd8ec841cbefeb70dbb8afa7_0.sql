-- job_id: script_job_ae0d2ee1fd8ec841cbefeb70dbb8afa7_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:03.426000+00:00
-- started: 2026-07-31T08:45:03.814000+00:00
-- ended: 2026-07-31T08:45:05.284000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
