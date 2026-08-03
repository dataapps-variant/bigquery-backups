-- job_id: script_job_f6a90c4246ef0cdcda56503f608dd7e9_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T14:51:17.459000+00:00
-- started: 2026-07-28T14:51:18.456000+00:00
-- ended: 2026-07-28T14:51:19.508000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history1`
WHERE captured_at < TIMESTAMP_SUB(current_timestamp, INTERVAL 2 HOUR)
