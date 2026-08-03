-- job_id: script_job_5f640869b6f55a9229086f6c06de48df_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:40:16.165000+00:00
-- started: 2026-07-28T12:40:16.284000+00:00
-- ended: 2026-07-28T12:40:16.484000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
