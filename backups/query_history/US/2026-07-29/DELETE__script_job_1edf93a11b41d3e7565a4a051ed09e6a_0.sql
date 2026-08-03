-- job_id: script_job_1edf93a11b41d3e7565a4a051ed09e6a_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T09:45:05.669000+00:00
-- started: 2026-07-29T09:45:06.221000+00:00
-- ended: 2026-07-29T09:45:07.705000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
