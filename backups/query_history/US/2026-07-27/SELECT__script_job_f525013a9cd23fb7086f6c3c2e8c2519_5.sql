-- job_id: script_job_f525013a9cd23fb7086f6c3c2e8c2519_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T14:10:17.503000+00:00
-- started: 2026-07-27T14:10:17.571000+00:00
-- ended: 2026-07-27T14:10:17.776000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
