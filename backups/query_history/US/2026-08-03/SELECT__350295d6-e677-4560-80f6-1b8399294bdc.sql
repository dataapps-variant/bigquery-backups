-- job_id: 350295d6-e677-4560-80f6-1b8399294bdc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:51.342000+00:00
-- started: 2026-08-03T12:29:51.430000+00:00
-- ended: 2026-08-03T12:29:51.651000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
