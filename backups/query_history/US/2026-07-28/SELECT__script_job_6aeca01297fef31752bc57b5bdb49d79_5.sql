-- job_id: script_job_6aeca01297fef31752bc57b5bdb49d79_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T04:40:13.482000+00:00
-- started: 2026-07-28T04:40:13.556000+00:00
-- ended: 2026-07-28T04:40:13.740000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
