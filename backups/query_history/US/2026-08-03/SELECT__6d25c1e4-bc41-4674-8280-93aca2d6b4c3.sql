-- job_id: 6d25c1e4-bc41-4674-8280-93aca2d6b4c3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:30.930000+00:00
-- started: 2026-08-03T13:02:31.047000+00:00
-- ended: 2026-08-03T13:02:31.741000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
