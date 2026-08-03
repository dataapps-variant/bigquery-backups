-- job_id: script_job_ebc43838124d03ebf84fd6970a2d01df_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-27T23:40:14.099000+00:00
-- started: 2026-07-27T23:40:14.496000+00:00
-- ended: 2026-07-27T23:40:15.532000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
