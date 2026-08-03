-- job_id: 1277c963-6261-4cf0-8e2f-a724761b7139
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:14.309000+00:00
-- started: 2026-08-03T11:53:14.476000+00:00
-- ended: 2026-08-03T11:53:14.745000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
