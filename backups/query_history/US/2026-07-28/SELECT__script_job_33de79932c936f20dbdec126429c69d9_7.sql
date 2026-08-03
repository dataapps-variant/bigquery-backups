-- job_id: script_job_33de79932c936f20dbdec126429c69d9_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T06:40:16.206000+00:00
-- started: 2026-07-28T06:40:16.268000+00:00
-- ended: 2026-07-28T06:40:16.449000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
