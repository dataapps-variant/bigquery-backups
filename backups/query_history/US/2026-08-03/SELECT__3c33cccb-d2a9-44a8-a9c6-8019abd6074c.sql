-- job_id: 3c33cccb-d2a9-44a8-a9c6-8019abd6074c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:42.979000+00:00
-- started: 2026-08-03T12:38:43.069000+00:00
-- ended: 2026-08-03T12:38:43.297000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
