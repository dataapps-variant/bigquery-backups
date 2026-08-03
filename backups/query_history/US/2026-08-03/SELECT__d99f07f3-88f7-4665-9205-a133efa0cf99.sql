-- job_id: d99f07f3-88f7-4665-9205-a133efa0cf99
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:49.665000+00:00
-- started: 2026-08-03T10:10:49.764000+00:00
-- ended: 2026-08-03T10:10:50.002000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
