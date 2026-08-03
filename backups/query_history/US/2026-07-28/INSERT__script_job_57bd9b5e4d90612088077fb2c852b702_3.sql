-- job_id: script_job_57bd9b5e4d90612088077fb2c852b702_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-28T07:40:08.311000+00:00
-- started: 2026-07-28T07:40:08.529000+00:00
-- ended: 2026-07-28T07:40:09.353000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING')
