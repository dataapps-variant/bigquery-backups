-- job_id: script_job_a559a9db58fec1930307d79593c7f724_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T22:40:18.965000+00:00
-- started: 2026-07-27T22:40:19.023000+00:00
-- ended: 2026-07-27T22:40:19.428000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
