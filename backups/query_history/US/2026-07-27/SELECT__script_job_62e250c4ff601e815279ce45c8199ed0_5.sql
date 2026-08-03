-- job_id: script_job_62e250c4ff601e815279ce45c8199ed0_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T19:40:16.264000+00:00
-- started: 2026-07-27T19:40:16.360000+00:00
-- ended: 2026-07-27T19:40:16.602000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
