-- job_id: script_job_c9697f72df8c741c192bf13853e65c91_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T13:40:13.651000+00:00
-- started: 2026-07-28T13:40:13.723000+00:00
-- ended: 2026-07-28T13:40:13.937000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
