-- job_id: script_job_36f851d8b9c83403cbdec48af43edf0d_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T17:40:16.402000+00:00
-- started: 2026-07-27T17:40:16.467000+00:00
-- ended: 2026-07-27T17:40:16.707000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
