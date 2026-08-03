-- job_id: script_job_c318f7f59cd8383e8362e7e8b453d8b7_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-27T17:40:17.097000+00:00
-- started: 2026-07-27T17:40:17.557000+00:00
-- ended: 2026-07-27T17:40:18.596000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
