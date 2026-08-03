-- job_id: script_job_503ebe1b9dfd45631dfde53b0698ecaf_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-27T15:10:15.226000+00:00
-- started: 2026-07-27T15:10:15.527000+00:00
-- ended: 2026-07-27T15:10:16.538000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING')
