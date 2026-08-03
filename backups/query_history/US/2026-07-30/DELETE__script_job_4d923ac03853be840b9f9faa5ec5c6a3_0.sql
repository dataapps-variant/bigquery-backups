-- job_id: script_job_4d923ac03853be840b9f9faa5ec5c6a3_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:45:04.657000+00:00
-- started: 2026-07-30T08:45:05.062000+00:00
-- ended: 2026-07-30T08:45:07.750000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
