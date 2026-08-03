-- job_id: script_job_c96504f1c0ea4b796e40739244fc140b_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-28T15:40:23.035000+00:00
-- started: 2026-07-28T15:40:23.456000+00:00
-- ended: 2026-07-28T15:40:24.468000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
