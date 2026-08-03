-- job_id: script_job_cdf9828f2a3cf77130c02290f96e6c95_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-27T22:40:13.062000+00:00
-- started: 2026-07-27T22:40:13.267000+00:00
-- ended: 2026-07-27T22:40:14.118000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING')
