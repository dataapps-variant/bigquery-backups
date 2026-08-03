-- job_id: script_job_9d012b75c8fab3a9ac50a1f59cd12914_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T15:40:18.657000+00:00
-- started: 2026-07-27T15:40:18.730000+00:00
-- ended: 2026-07-27T15:40:19.250000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
