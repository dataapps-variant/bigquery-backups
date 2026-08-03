-- job_id: 3776f46c-1922-4b81-ae63-d8751fb3ca95
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:28.798000+00:00
-- started: 2026-08-03T11:52:28.938000+00:00
-- ended: 2026-08-03T11:52:29.185000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
