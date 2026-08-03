-- job_id: script_job_001185ee9de07e3675759c90c400ec8d_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T14:03:40.438000+00:00
-- started: 2026-07-27T14:03:41.124000+00:00
-- ended: 2026-07-27T14:03:42.705000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
