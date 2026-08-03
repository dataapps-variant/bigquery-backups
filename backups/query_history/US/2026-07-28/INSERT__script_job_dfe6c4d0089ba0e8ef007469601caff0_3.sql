-- job_id: script_job_dfe6c4d0089ba0e8ef007469601caff0_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-28T14:40:05.439000+00:00
-- started: 2026-07-28T14:40:05.642000+00:00
-- ended: 2026-07-28T14:40:06.472000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING')
