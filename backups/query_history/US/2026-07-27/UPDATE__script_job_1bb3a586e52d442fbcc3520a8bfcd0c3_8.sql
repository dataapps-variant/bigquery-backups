-- job_id: script_job_1bb3a586e52d442fbcc3520a8bfcd0c3_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-27T20:40:18.134000+00:00
-- started: 2026-07-27T20:40:18.566000+00:00
-- ended: 2026-07-27T20:40:19.573000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
