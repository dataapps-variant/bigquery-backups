-- job_id: script_job_8b4d29880976f51ede1499d2981da57a_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T14:51:17.172000+00:00
-- started: 2026-07-28T14:51:17.470000+00:00
-- ended: 2026-07-28T14:51:18.343000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history1`
WHERE captured_at < TIMESTAMP_SUB(current_timestamp, INTERVAL 2 HOUR)
