-- job_id: script_job_f3aea161130fadd86a52beefc82ac1c9_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T04:40:14.682000+00:00
-- started: 2026-07-28T04:40:14.762000+00:00
-- ended: 2026-07-28T04:40:14.984000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
