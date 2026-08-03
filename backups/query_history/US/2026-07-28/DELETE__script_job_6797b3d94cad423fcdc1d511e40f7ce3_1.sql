-- job_id: script_job_6797b3d94cad423fcdc1d511e40f7ce3_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T15:40:08.988000+00:00
-- started: 2026-07-28T15:40:09.485000+00:00
-- ended: 2026-07-28T15:40:11.139000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history1`
WHERE captured_at < TIMESTAMP_SUB(current_timestamp, INTERVAL 2 HOUR)
