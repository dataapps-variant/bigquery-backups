-- job_id: script_job_f834c95c6ce478071e3d4536b4baa786_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T14:39:49.998000+00:00
-- started: 2026-07-28T14:39:50.361000+00:00
-- ended: 2026-07-28T14:39:51.332000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history1`
WHERE captured_at < TIMESTAMP_SUB(current_timestamp, INTERVAL 2 HOUR)
