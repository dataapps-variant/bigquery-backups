-- job_id: script_job_711cb91178c98c96c477bf0e1c389627_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:40:12.828000+00:00
-- started: 2026-07-28T08:40:12.896000+00:00
-- ended: 2026-07-28T08:40:13.182000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
