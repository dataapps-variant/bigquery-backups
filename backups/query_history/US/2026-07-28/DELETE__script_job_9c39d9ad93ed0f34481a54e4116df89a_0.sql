-- job_id: script_job_9c39d9ad93ed0f34481a54e4116df89a_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:30:08.761000+00:00
-- started: 2026-07-28T08:30:09.134000+00:00
-- ended: 2026-07-28T08:30:10.223000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
