-- job_id: script_job_3ac085deb0cfba5b610e205d020d6d21_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-27T19:40:10.286000+00:00
-- started: 2026-07-27T19:40:10.537000+00:00
-- ended: 2026-07-27T19:40:11.474000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING')
