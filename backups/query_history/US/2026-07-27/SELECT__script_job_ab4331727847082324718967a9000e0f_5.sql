-- job_id: script_job_ab4331727847082324718967a9000e0f_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T18:23:38.600000+00:00
-- started: 2026-07-27T18:23:38.667000+00:00
-- ended: 2026-07-27T18:23:39.045000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
