-- job_id: script_job_7a99fbef98059c7cf73dc7815b4eb986_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T06:40:15.629000+00:00
-- started: 2026-07-28T06:40:15.712000+00:00
-- ended: 2026-07-28T06:40:15.938000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
