-- job_id: script_job_8c61fae7e90929e6443025f306c10f4b_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T15:40:17.528000+00:00
-- started: 2026-07-27T15:40:17.597000+00:00
-- ended: 2026-07-27T15:40:17.871000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
