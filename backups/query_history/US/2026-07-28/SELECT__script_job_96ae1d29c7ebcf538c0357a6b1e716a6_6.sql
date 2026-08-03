-- job_id: script_job_96ae1d29c7ebcf538c0357a6b1e716a6_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T00:40:14.797000+00:00
-- started: 2026-07-28T00:40:14.885000+00:00
-- ended: 2026-07-28T00:40:15.123000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
