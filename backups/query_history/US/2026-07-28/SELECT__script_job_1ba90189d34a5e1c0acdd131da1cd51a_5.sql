-- job_id: script_job_1ba90189d34a5e1c0acdd131da1cd51a_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:40:12.444000+00:00
-- started: 2026-07-28T11:40:12.522000+00:00
-- ended: 2026-07-28T11:40:12.744000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
