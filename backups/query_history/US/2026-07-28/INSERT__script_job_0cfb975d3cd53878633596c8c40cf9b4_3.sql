-- job_id: script_job_0cfb975d3cd53878633596c8c40cf9b4_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-28T08:40:06.193000+00:00
-- started: 2026-07-28T08:40:06.367000+00:00
-- ended: 2026-07-28T08:40:07.293000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING')
