-- job_id: script_job_c678414b100be8e921d498dbb4709c2a_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T18:23:40.349000+00:00
-- started: 2026-07-27T18:23:40.407000+00:00
-- ended: 2026-07-27T18:23:40.838000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
