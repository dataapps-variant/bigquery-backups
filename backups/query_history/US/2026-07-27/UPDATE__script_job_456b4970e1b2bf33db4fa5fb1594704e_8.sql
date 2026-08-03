-- job_id: script_job_456b4970e1b2bf33db4fa5fb1594704e_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-27T19:40:18.015000+00:00
-- started: 2026-07-27T19:40:18.437000+00:00
-- ended: 2026-07-27T19:40:19.630000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
