-- job_id: script_job_10804dc953ed0f37ed9ab4dad3f89f35_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T01:40:16.352000+00:00
-- started: 2026-07-28T01:40:16.428000+00:00
-- ended: 2026-07-28T01:40:16.674000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
