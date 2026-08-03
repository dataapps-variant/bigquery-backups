-- job_id: script_job_9cae6a4da69b609f1fc331ce073559ff_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T01:40:05.984000+00:00
-- started: 2026-07-28T01:40:06.326000+00:00
-- ended: 2026-07-28T01:40:07.852000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
