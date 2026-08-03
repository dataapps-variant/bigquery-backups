-- job_id: script_job_eda43f999f60c65b45ef5e29cfd7cbc8_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T19:40:16.860000+00:00
-- started: 2026-07-27T19:40:16.967000+00:00
-- ended: 2026-07-27T19:40:17.200000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
