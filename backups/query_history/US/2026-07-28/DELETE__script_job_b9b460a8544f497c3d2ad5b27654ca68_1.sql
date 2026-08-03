-- job_id: script_job_b9b460a8544f497c3d2ad5b27654ca68_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T13:40:03.342000+00:00
-- started: 2026-07-28T13:40:03.630000+00:00
-- ended: 2026-07-28T13:40:05.122000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
