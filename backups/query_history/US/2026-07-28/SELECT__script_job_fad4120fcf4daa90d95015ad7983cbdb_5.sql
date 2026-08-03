-- job_id: script_job_fad4120fcf4daa90d95015ad7983cbdb_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T13:40:12.655000+00:00
-- started: 2026-07-28T13:40:12.686000+00:00
-- ended: 2026-07-28T13:40:12.918000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
