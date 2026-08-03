-- job_id: script_job_ecf69e448d03dc5632586fe1afde946f_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T04:40:03.468000+00:00
-- started: 2026-07-28T04:40:03.888000+00:00
-- ended: 2026-07-28T04:40:05.650000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
