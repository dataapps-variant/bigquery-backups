-- job_id: script_job_1b88e1032a81f0448d504c3ddfa3a7f3_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T01:40:15.784000+00:00
-- started: 2026-07-28T01:40:15.857000+00:00
-- ended: 2026-07-28T01:40:16.053000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
