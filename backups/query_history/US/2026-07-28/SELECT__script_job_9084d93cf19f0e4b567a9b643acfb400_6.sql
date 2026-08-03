-- job_id: script_job_9084d93cf19f0e4b567a9b643acfb400_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T15:40:22.100000+00:00
-- started: 2026-07-28T15:40:22.167000+00:00
-- ended: 2026-07-28T15:40:22.361000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
