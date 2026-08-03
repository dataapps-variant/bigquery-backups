-- job_id: 6c16a8c1-e090-4336-8d08-e1ca641ae88e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:32.459000+00:00
-- started: 2026-08-03T13:03:32.604000+00:00
-- ended: 2026-08-03T13:03:32.975000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
