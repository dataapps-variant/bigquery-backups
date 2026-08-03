-- job_id: script_job_4f5e6afdf96cdbdbc8eff83b1deda8a6_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:30:08.259000+00:00
-- started: 2026-07-29T08:30:08.730000+00:00
-- ended: 2026-07-29T08:30:10.921000+00:00

DELETE FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
