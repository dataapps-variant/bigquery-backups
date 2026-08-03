-- job_id: script_job_c262d8df6a19c4402a617ec5dd77d1f7_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T00:40:15.345000+00:00
-- started: 2026-07-28T00:40:15.416000+00:00
-- ended: 2026-07-28T00:40:15.635000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
