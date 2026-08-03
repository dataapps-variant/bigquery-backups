-- job_id: script_job_7a1337ed4ca5c60691175c67cd71f1ca_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T14:51:17.404000+00:00
-- started: 2026-07-28T14:51:17.803000+00:00
-- ended: 2026-07-28T14:51:18.843000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history1`
WHERE captured_at < TIMESTAMP_SUB(current_timestamp, INTERVAL 2 HOUR)
