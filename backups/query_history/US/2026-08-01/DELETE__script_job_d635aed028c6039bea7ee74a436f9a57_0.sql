-- job_id: script_job_d635aed028c6039bea7ee74a436f9a57_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:45:03.694000+00:00
-- started: 2026-08-01T08:45:04.017000+00:00
-- ended: 2026-08-01T08:45:05.243000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
