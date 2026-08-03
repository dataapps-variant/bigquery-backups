-- job_id: script_job_fe7ec59d002c293461e05489d9207190_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T22:40:20.408000+00:00
-- started: 2026-07-27T22:40:20.483000+00:00
-- ended: 2026-07-27T22:40:20.822000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
