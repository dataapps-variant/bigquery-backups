-- job_id: script_job_78660757d5f83ae8eb6fdf4aed7dbc6b_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T23:40:13.464000+00:00
-- started: 2026-07-27T23:40:13.583000+00:00
-- ended: 2026-07-27T23:40:13.811000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
