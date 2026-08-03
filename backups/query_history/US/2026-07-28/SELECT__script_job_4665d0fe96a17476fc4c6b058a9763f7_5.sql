-- job_id: script_job_4665d0fe96a17476fc4c6b058a9763f7_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T06:40:15.137000+00:00
-- started: 2026-07-28T06:40:15.200000+00:00
-- ended: 2026-07-28T06:40:15.390000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
