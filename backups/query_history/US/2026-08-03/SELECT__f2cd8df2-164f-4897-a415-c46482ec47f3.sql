-- job_id: f2cd8df2-164f-4897-a415-c46482ec47f3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:34.706000+00:00
-- started: 2026-08-03T09:50:34.793000+00:00
-- ended: 2026-08-03T09:50:35.093000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
