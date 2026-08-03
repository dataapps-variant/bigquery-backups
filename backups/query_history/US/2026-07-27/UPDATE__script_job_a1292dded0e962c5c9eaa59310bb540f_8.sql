-- job_id: script_job_a1292dded0e962c5c9eaa59310bb540f_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-27T14:03:53.356000+00:00
-- started: 2026-07-27T14:03:53.764000+00:00
-- ended: 2026-07-27T14:03:55.016000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
