-- job_id: script_job_4f4aa8b0ed8c21ce59416735258516c1_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T18:40:03.933000+00:00
-- started: 2026-07-27T18:40:04.302000+00:00
-- ended: 2026-07-27T18:40:06.335000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
