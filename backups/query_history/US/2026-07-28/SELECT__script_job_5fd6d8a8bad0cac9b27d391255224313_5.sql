-- job_id: script_job_5fd6d8a8bad0cac9b27d391255224313_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T07:40:13.305000+00:00
-- started: 2026-07-28T07:40:13.370000+00:00
-- ended: 2026-07-28T07:40:13.567000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
