-- job_id: script_job_85ba832f04a0a93e627423b62d44855a_8
-- user: dataapps@variant.net
-- statement_type: UPDATE
-- created: 2026-07-28T10:40:12.935000+00:00
-- started: 2026-07-28T10:40:13.419000+00:00
-- ended: 2026-07-28T10:40:14.361000+00:00

UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id
