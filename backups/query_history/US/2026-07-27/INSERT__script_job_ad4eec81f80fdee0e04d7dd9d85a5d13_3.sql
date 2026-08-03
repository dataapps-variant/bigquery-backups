-- job_id: script_job_ad4eec81f80fdee0e04d7dd9d85a5d13_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-27T18:40:08.110000+00:00
-- started: 2026-07-27T18:40:08.354000+00:00
-- ended: 2026-07-27T18:40:09.181000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING')
