-- job_id: 9b3fbeee-048f-4776-921c-b68e7311b558
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:35.688000+00:00
-- started: 2026-08-03T13:03:35.830000+00:00
-- ended: 2026-08-03T13:03:36.107000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
