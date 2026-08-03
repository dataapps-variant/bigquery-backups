-- job_id: script_job_17ef1b6d8299074a5d20002e28e862e9_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T03:40:15.769000+00:00
-- started: 2026-07-28T03:40:15.864000+00:00
-- ended: 2026-07-28T03:40:16.039000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
