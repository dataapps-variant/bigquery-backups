-- job_id: script_job_e3f393a483227781fc9e268b6677b110_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T02:40:15.631000+00:00
-- started: 2026-07-28T02:40:15.704000+00:00
-- ended: 2026-07-28T02:40:15.964000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
