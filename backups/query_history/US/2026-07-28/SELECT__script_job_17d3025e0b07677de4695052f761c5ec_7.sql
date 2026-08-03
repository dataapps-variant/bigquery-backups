-- job_id: script_job_17d3025e0b07677de4695052f761c5ec_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:40:16.679000+00:00
-- started: 2026-07-28T12:40:16.738000+00:00
-- ended: 2026-07-28T12:40:16.931000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
