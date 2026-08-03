-- job_id: script_job_35bf2034acb0d39f1632e8efb686e88c_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T15:10:23.600000+00:00
-- started: 2026-07-27T15:10:23.690000+00:00
-- ended: 2026-07-27T15:10:23.902000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
