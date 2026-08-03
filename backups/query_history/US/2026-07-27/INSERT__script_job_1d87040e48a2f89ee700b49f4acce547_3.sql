-- job_id: script_job_1d87040e48a2f89ee700b49f4acce547_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-27T23:40:06.007000+00:00
-- started: 2026-07-27T23:40:06.236000+00:00
-- ended: 2026-07-27T23:40:07.078000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING')
