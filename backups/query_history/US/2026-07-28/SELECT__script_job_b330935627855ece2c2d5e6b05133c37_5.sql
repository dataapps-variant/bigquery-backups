-- job_id: script_job_b330935627855ece2c2d5e6b05133c37_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T15:40:21.671000+00:00
-- started: 2026-07-28T15:40:21.703000+00:00
-- ended: 2026-07-28T15:40:21.901000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
