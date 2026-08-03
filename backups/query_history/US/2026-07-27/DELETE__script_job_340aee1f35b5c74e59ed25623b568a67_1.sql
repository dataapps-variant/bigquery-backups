-- job_id: script_job_340aee1f35b5c74e59ed25623b568a67_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T17:40:04.507000+00:00
-- started: 2026-07-27T17:40:04.930000+00:00
-- ended: 2026-07-27T17:40:06.993000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
