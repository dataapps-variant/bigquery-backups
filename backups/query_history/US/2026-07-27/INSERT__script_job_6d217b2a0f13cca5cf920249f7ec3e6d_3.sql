-- job_id: script_job_6d217b2a0f13cca5cf920249f7ec3e6d_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-27T14:03:45.027000+00:00
-- started: 2026-07-27T14:03:45.246000+00:00
-- ended: 2026-07-27T14:03:46.192000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING')
