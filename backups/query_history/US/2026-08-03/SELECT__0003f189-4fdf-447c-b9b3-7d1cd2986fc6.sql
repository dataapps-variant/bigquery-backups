-- job_id: 0003f189-4fdf-447c-b9b3-7d1cd2986fc6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:51.290000+00:00
-- started: 2026-08-03T12:37:51.425000+00:00
-- ended: 2026-08-03T12:37:51.690000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
