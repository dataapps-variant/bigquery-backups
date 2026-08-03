-- job_id: script_job_6895b7beaa58b3da330f871ac7c3dbb9_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:30:01.827000+00:00
-- started: 2026-08-03T08:30:02.202000+00:00
-- ended: 2026-08-03T08:30:03.318000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
