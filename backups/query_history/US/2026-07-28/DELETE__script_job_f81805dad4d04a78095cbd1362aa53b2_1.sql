-- job_id: script_job_f81805dad4d04a78095cbd1362aa53b2_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T02:40:05.340000+00:00
-- started: 2026-07-28T02:40:05.734000+00:00
-- ended: 2026-07-28T02:40:07.400000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
