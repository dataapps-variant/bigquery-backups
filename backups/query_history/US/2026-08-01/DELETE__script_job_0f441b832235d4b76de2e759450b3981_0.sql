-- job_id: script_job_0f441b832235d4b76de2e759450b3981_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:45:02.048000+00:00
-- started: 2026-08-01T08:45:02.351000+00:00
-- ended: 2026-08-01T08:45:03.408000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
