-- job_id: a349db25-08db-4424-bc80-bf61d6f8b117
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:35.547000+00:00
-- started: 2026-08-03T12:37:35.658000+00:00
-- ended: 2026-08-03T12:37:35.912000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
