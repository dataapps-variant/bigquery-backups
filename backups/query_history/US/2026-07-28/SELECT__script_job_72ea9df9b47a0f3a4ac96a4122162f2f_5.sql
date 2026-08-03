-- job_id: script_job_72ea9df9b47a0f3a4ac96a4122162f2f_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T05:40:14.238000+00:00
-- started: 2026-07-28T05:40:14.324000+00:00
-- ended: 2026-07-28T05:40:14.567000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
