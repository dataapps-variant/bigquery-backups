-- job_id: script_job_bc6219a34dcdf2482136391dfa377d42_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:40:12.258000+00:00
-- started: 2026-07-28T08:40:12.412000+00:00
-- ended: 2026-07-28T08:40:12.620000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
