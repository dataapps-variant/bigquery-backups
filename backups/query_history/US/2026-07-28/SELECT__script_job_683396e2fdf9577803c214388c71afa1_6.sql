-- job_id: script_job_683396e2fdf9577803c214388c71afa1_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T10:40:11.866000+00:00
-- started: 2026-07-28T10:40:11.950000+00:00
-- ended: 2026-07-28T10:40:12.159000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
