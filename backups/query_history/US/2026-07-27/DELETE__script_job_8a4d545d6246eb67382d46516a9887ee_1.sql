-- job_id: script_job_8a4d545d6246eb67382d46516a9887ee_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T21:40:02.319000+00:00
-- started: 2026-07-27T21:40:02.758000+00:00
-- ended: 2026-07-27T21:40:05.561000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
