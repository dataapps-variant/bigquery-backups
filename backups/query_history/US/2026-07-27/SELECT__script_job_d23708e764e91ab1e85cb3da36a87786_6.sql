-- job_id: script_job_d23708e764e91ab1e85cb3da36a87786_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T15:40:18.135000+00:00
-- started: 2026-07-27T15:40:18.202000+00:00
-- ended: 2026-07-27T15:40:18.421000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
