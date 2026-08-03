-- job_id: script_job_c3f7d5ebada9e0625b33e3060ce68619_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T18:40:15.241000+00:00
-- started: 2026-07-27T18:40:15.319000+00:00
-- ended: 2026-07-27T18:40:15.577000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
