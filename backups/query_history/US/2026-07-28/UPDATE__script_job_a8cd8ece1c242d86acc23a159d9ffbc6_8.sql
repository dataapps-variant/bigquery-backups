-- job_id: script_job_a8cd8ece1c242d86acc23a159d9ffbc6_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-28T12:40:17.149000+00:00
-- started: 2026-07-28T12:40:17.491000+00:00
-- ended: 2026-07-28T12:40:18.769000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
