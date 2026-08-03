-- job_id: script_job_05379e4e993723468de8801d05c074a3_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:40:13.570000+00:00
-- started: 2026-07-28T11:40:13.653000+00:00
-- ended: 2026-07-28T11:40:13.858000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
