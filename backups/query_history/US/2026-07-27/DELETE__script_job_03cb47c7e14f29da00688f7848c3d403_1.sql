-- job_id: script_job_03cb47c7e14f29da00688f7848c3d403_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T20:40:05.054000+00:00
-- started: 2026-07-27T20:40:05.600000+00:00
-- ended: 2026-07-27T20:40:07.376000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
