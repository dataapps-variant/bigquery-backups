-- job_id: script_job_f11ea14063f9d0a7e67f9ef15a792596_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:30:04.371000+00:00
-- started: 2026-08-01T08:30:04.851000+00:00
-- ended: 2026-08-01T08:30:05.969000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
