-- job_id: script_job_9440e8520e4fba7de94ba5a6df782f20_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T15:40:22.578000+00:00
-- started: 2026-07-28T15:40:22.618000+00:00
-- ended: 2026-07-28T15:40:22.816000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
