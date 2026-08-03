-- job_id: script_job_74c7b2a7f7ba3d03afd5bf0e539bdb89_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T17:40:15.266000+00:00
-- started: 2026-07-27T17:40:15.322000+00:00
-- ended: 2026-07-27T17:40:15.567000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
