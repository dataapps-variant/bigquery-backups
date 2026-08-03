-- job_id: script_job_e0382dd104e108ff28c847262b1aa2b3_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:40:13.576000+00:00
-- started: 2026-07-28T09:40:13.658000+00:00
-- ended: 2026-07-28T09:40:13.941000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
