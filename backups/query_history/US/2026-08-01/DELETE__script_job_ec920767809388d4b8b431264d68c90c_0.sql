-- job_id: script_job_ec920767809388d4b8b431264d68c90c_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:45:04.020000+00:00
-- started: 2026-08-01T08:45:04.371000+00:00
-- ended: 2026-08-01T08:45:05.461000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
