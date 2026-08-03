-- job_id: script_job_74c2a401c4834a2baf19e56e7b161ed5_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-28T03:40:09.553000+00:00
-- started: 2026-07-28T03:40:09.746000+00:00
-- ended: 2026-07-28T03:40:10.677000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING')
