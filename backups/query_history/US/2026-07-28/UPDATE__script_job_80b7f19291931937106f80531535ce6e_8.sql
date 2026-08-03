-- job_id: script_job_80b7f19291931937106f80531535ce6e_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-28T05:40:15.943000+00:00
-- started: 2026-07-28T05:40:16.549000+00:00
-- ended: 2026-07-28T05:40:17.661000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
