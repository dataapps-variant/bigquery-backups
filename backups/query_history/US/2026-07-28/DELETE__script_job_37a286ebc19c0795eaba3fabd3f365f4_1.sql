-- job_id: script_job_37a286ebc19c0795eaba3fabd3f365f4_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:40:02.334000+00:00
-- started: 2026-07-28T08:40:02.663000+00:00
-- ended: 2026-07-28T08:40:04.169000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
