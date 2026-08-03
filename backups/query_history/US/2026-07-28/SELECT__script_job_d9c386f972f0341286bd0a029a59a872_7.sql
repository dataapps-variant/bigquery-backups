-- job_id: script_job_d9c386f972f0341286bd0a029a59a872_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T02:40:16.770000+00:00
-- started: 2026-07-28T02:40:16.839000+00:00
-- ended: 2026-07-28T02:40:17.004000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
