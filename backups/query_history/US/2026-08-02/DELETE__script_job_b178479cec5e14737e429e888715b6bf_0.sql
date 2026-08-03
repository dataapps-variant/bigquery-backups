-- job_id: script_job_b178479cec5e14737e429e888715b6bf_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:45:01.684000+00:00
-- started: 2026-08-02T08:45:02.055000+00:00
-- ended: 2026-08-02T08:45:03.178000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
