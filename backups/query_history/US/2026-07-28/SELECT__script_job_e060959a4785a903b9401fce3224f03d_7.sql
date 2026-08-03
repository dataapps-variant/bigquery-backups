-- job_id: script_job_e060959a4785a903b9401fce3224f03d_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T07:40:14.427000+00:00
-- started: 2026-07-28T07:40:14.500000+00:00
-- ended: 2026-07-28T07:40:14.709000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
