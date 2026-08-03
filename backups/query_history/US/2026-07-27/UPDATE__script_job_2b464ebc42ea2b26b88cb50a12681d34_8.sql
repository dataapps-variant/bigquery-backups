-- job_id: script_job_2b464ebc42ea2b26b88cb50a12681d34_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-27T15:10:25.148000+00:00
-- started: 2026-07-27T15:10:25.624000+00:00
-- ended: 2026-07-27T15:10:27.393000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
