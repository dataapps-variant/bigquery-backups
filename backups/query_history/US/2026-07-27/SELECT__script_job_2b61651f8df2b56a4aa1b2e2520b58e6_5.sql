-- job_id: script_job_2b61651f8df2b56a4aa1b2e2520b58e6_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T18:40:14.256000+00:00
-- started: 2026-07-27T18:40:14.323000+00:00
-- ended: 2026-07-27T18:40:14.506000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
