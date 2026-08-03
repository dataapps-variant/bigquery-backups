-- job_id: script_job_0a59779c9d2be454692927baa9eba55b_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T23:40:02.261000+00:00
-- started: 2026-07-27T23:40:02.635000+00:00
-- ended: 2026-07-27T23:40:04.059000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
