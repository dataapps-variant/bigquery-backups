-- job_id: script_job_76fff5dd9945d6d90a1f4e683a9f6df7_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T05:40:15.373000+00:00
-- started: 2026-07-28T05:40:15.458000+00:00
-- ended: 2026-07-28T05:40:15.671000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
