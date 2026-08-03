-- job_id: script_job_9eb5a6b088b7dccbde39040f385b2d86_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:01.787000+00:00
-- started: 2026-08-02T08:45:02.129000+00:00
-- ended: 2026-08-02T08:45:03.257000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
