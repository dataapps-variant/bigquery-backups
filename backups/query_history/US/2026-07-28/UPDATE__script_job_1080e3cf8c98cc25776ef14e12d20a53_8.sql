-- job_id: script_job_1080e3cf8c98cc25776ef14e12d20a53_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-28T08:40:13.450000+00:00
-- started: 2026-07-28T08:40:13.808000+00:00
-- ended: 2026-07-28T08:40:14.745000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
