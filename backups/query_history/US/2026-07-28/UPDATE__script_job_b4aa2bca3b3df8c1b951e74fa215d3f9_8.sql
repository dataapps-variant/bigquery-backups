-- job_id: script_job_b4aa2bca3b3df8c1b951e74fa215d3f9_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-28T09:40:14.095000+00:00
-- started: 2026-07-28T09:40:14.497000+00:00
-- ended: 2026-07-28T09:40:15.516000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
