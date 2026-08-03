-- job_id: script_job_fa56377adef431efb091deadab676a2c_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T14:10:18.758000+00:00
-- started: 2026-07-27T14:10:18.851000+00:00
-- ended: 2026-07-27T14:10:19.173000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
