-- job_id: script_job_4a9f00cc4fd32dd3b5f32e71fb86fc0e_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T20:40:17.546000+00:00
-- started: 2026-07-27T20:40:17.612000+00:00
-- ended: 2026-07-27T20:40:17.850000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
