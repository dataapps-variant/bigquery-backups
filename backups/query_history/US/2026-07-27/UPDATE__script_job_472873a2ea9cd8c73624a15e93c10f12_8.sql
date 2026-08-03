-- job_id: script_job_472873a2ea9cd8c73624a15e93c10f12_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-27T15:40:19.465000+00:00
-- started: 2026-07-27T15:40:19.796000+00:00
-- ended: 2026-07-27T15:40:20.868000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
