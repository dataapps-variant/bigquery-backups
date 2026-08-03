-- job_id: script_job_bba1d42a27d8da506a0f9dc0cc92280a_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-27T18:23:41.126000+00:00
-- started: 2026-07-27T18:23:41.536000+00:00
-- ended: 2026-07-27T18:23:49.155000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
