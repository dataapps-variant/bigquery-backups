-- job_id: script_job_5865c463f01b476693572c2d3dc60011_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:45:04.597000+00:00
-- started: 2026-07-31T08:45:05.080000+00:00
-- ended: 2026-07-31T08:45:06.266000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
