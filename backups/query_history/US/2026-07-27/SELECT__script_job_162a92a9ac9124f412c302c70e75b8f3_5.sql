-- job_id: script_job_162a92a9ac9124f412c302c70e75b8f3_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T16:40:14.230000+00:00
-- started: 2026-07-27T16:40:14.280000+00:00
-- ended: 2026-07-27T16:40:14.512000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
