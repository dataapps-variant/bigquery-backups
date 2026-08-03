-- job_id: script_job_1ca2cd547296b8c11f498cd0c92acf63_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:40:13.122000+00:00
-- started: 2026-07-28T09:40:13.185000+00:00
-- ended: 2026-07-28T09:40:13.389000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
