-- job_id: script_job_ad1fd5217b4e117fc2833ef7a3b48dc6_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T07:40:13.887000+00:00
-- started: 2026-07-28T07:40:13.966000+00:00
-- ended: 2026-07-28T07:40:14.230000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
