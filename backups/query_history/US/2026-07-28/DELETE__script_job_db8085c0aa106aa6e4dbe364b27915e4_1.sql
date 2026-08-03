-- job_id: script_job_db8085c0aa106aa6e4dbe364b27915e4_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T15:40:04.077000+00:00
-- started: 2026-07-28T15:40:04.428000+00:00
-- ended: 2026-07-28T15:40:06.180000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
