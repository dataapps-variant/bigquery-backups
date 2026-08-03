-- job_id: script_job_3d7f26483a499413a53df641826f612a_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T22:40:18.373000+00:00
-- started: 2026-07-27T22:40:18.428000+00:00
-- ended: 2026-07-27T22:40:18.764000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
