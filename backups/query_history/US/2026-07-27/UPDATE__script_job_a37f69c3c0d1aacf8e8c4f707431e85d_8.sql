-- job_id: script_job_a37f69c3c0d1aacf8e8c4f707431e85d_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-27T18:40:15.830000+00:00
-- started: 2026-07-27T18:40:16.222000+00:00
-- ended: 2026-07-27T18:40:17.213000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
