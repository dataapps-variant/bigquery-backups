-- job_id: script_job_9b9256785ea2a10276570ddb64830f4d_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T21:40:14.793000+00:00
-- started: 2026-07-27T21:40:14.871000+00:00
-- ended: 2026-07-27T21:40:15.119000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
