-- job_id: script_job_161109ad9db4b64f1fb9ef511f73d3d5_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-27T14:10:10.948000+00:00
-- started: 2026-07-27T14:10:11.166000+00:00
-- ended: 2026-07-27T14:10:12.185000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING')
