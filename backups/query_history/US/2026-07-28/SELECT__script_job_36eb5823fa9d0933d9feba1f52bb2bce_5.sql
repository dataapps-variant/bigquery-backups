-- job_id: script_job_36eb5823fa9d0933d9feba1f52bb2bce_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T03:40:15.138000+00:00
-- started: 2026-07-28T03:40:15.234000+00:00
-- ended: 2026-07-28T03:40:15.499000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
