-- job_id: script_job_c1a65d34bff513aaa40c1a6f7bcc3450_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T15:10:22.863000+00:00
-- started: 2026-07-27T15:10:22.979000+00:00
-- ended: 2026-07-27T15:10:23.291000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
