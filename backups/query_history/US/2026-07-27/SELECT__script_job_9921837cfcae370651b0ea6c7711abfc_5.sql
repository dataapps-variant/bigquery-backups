-- job_id: script_job_9921837cfcae370651b0ea6c7711abfc_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T23:40:11.997000+00:00
-- started: 2026-07-27T23:40:12.363000+00:00
-- ended: 2026-07-27T23:40:12.664000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
