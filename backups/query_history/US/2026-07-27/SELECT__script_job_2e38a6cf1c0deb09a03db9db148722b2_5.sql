-- job_id: script_job_2e38a6cf1c0deb09a03db9db148722b2_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T20:40:16.313000+00:00
-- started: 2026-07-27T20:40:16.401000+00:00
-- ended: 2026-07-27T20:40:16.676000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
