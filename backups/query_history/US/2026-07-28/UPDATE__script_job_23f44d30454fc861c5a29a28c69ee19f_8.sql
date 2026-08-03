-- job_id: script_job_23f44d30454fc861c5a29a28c69ee19f_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-28T00:40:15.869000+00:00
-- started: 2026-07-28T00:40:16.235000+00:00
-- ended: 2026-07-28T00:40:17.455000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
