-- job_id: script_job_3335f5b665bc43e5ac034d6d9ecb1b95_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-28T11:40:14.187000+00:00
-- started: 2026-07-28T11:40:14.559000+00:00
-- ended: 2026-07-28T11:40:15.702000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
