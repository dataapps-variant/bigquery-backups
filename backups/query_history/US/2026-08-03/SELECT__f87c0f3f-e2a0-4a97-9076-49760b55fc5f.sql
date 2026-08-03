-- job_id: f87c0f3f-e2a0-4a97-9076-49760b55fc5f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:45.140000+00:00
-- started: 2026-08-03T10:10:45.233000+00:00
-- ended: 2026-08-03T10:10:45.461000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
