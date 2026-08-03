-- job_id: script_job_bfed80d5b97c202545cec89b031e722f_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-27T14:10:19.466000+00:00
-- started: 2026-07-27T14:10:19.835000+00:00
-- ended: 2026-07-27T14:10:22.102000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
