-- job_id: script_job_4b09d11c73f958a977824067b4441164_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T14:03:52.168000+00:00
-- started: 2026-07-27T14:03:52.236000+00:00
-- ended: 2026-07-27T14:03:52.440000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
