-- job_id: script_job_ac63fb865c3debe9eb506aa00310e197_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-28T14:40:12.998000+00:00
-- started: 2026-07-28T14:40:13.443000+00:00
-- ended: 2026-07-28T14:40:14.479000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
