-- job_id: script_job_11d7a01470fecee04c8ddd880031705e_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-28T01:40:16.940000+00:00
-- started: 2026-07-28T01:40:17.301000+00:00
-- ended: 2026-07-28T01:40:18.232000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
