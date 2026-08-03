-- job_id: script_job_4eadcf8e865b5bcbf5c67010c7948504_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T12:40:05.578000+00:00
-- started: 2026-07-28T12:40:05.915000+00:00
-- ended: 2026-07-28T12:40:07.616000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
