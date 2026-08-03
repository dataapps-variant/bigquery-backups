-- job_id: script_job_668c469d3dd06bfa3cdde2e7288e69c1_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T14:10:18.043000+00:00
-- started: 2026-07-27T14:10:18.112000+00:00
-- ended: 2026-07-27T14:10:18.353000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
