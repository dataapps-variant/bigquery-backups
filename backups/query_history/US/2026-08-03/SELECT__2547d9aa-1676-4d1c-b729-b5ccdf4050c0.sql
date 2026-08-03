-- job_id: 2547d9aa-1676-4d1c-b729-b5ccdf4050c0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:12.204000+00:00
-- started: 2026-08-03T13:03:12.311000+00:00
-- ended: 2026-08-03T13:03:13.043000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
