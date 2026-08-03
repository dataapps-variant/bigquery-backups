-- job_id: script_job_54e6390efcacb7c18f842165d575a82e_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-28T06:40:09.391000+00:00
-- started: 2026-07-28T06:40:09.565000+00:00
-- ended: 2026-07-28T06:40:10.392000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING')
