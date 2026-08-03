-- job_id: script_job_77df8faaec0b9d4eb95b679b3e9540b6_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T01:40:15.242000+00:00
-- started: 2026-07-28T01:40:15.352000+00:00
-- ended: 2026-07-28T01:40:15.570000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
