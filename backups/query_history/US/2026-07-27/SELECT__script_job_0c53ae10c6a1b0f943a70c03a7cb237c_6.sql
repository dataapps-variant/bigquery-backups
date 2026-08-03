-- job_id: script_job_0c53ae10c6a1b0f943a70c03a7cb237c_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T23:40:12.936000+00:00
-- started: 2026-07-27T23:40:13.047000+00:00
-- ended: 2026-07-27T23:40:13.268000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
