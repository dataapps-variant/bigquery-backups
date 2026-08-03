-- job_id: script_job_f04d8509b10660039ccc9176e4b19da2_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-28T04:40:15.184000+00:00
-- started: 2026-07-28T04:40:15.465000+00:00
-- ended: 2026-07-28T04:40:16.567000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
