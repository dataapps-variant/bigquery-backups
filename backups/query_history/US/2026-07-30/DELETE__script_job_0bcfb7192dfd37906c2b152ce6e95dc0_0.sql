-- job_id: script_job_0bcfb7192dfd37906c2b152ce6e95dc0_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:30:05.862000+00:00
-- started: 2026-07-30T08:30:06.287000+00:00
-- ended: 2026-07-30T08:30:08.777000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
