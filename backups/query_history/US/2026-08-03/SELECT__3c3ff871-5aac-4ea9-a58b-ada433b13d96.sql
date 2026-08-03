-- job_id: 3c3ff871-5aac-4ea9-a58b-ada433b13d96
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:22.365000+00:00
-- started: 2026-08-03T12:38:22.467000+00:00
-- ended: 2026-08-03T12:38:22.684000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
