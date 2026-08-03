-- job_id: script_job_5b9999a3ebb430af29c4d0d89ef5e38e_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-27T22:40:21.056000+00:00
-- started: 2026-07-27T22:40:21.421000+00:00
-- ended: 2026-07-27T22:40:22.480000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
