-- job_id: script_job_2700b5f06f6209524459282381abe903_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T17:40:15.830000+00:00
-- started: 2026-07-27T17:40:15.897000+00:00
-- ended: 2026-07-27T17:40:16.138000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
