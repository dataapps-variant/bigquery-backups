-- job_id: script_job_58629b61d145fdea55ce32c6378e555c_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-28T11:40:05.914000+00:00
-- started: 2026-07-28T11:40:06.170000+00:00
-- ended: 2026-07-28T11:40:08.411000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING')
