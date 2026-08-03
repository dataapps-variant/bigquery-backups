-- job_id: script_job_b912a5a0fd91ffe69c27322d44d2a6a9_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-28T07:40:14.972000+00:00
-- started: 2026-07-28T07:40:15.301000+00:00
-- ended: 2026-07-28T07:40:20.694000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
