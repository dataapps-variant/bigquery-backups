-- job_id: script_job_062cabee478b41966d20faf5ef057493_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T10:40:11.332000+00:00
-- started: 2026-07-28T10:40:11.429000+00:00
-- ended: 2026-07-28T10:40:11.618000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
