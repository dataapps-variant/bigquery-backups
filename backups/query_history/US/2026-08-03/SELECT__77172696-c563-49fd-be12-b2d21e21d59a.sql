-- job_id: 77172696-c563-49fd-be12-b2d21e21d59a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:40.149000+00:00
-- started: 2026-08-03T12:38:40.290000+00:00
-- ended: 2026-08-03T12:38:40.498000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
