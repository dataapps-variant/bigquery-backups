-- job_id: script_job_af31448ede65a1cc4ffe454b768de3f3_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:40:11.712000+00:00
-- started: 2026-07-28T08:40:11.770000+00:00
-- ended: 2026-07-28T08:40:12.017000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
