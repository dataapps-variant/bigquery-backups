-- job_id: fcd5082c-9372-49c6-83c7-6ba921564e11
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:34.621000+00:00
-- started: 2026-08-03T10:10:34.696000+00:00
-- ended: 2026-08-03T10:10:34.903000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
