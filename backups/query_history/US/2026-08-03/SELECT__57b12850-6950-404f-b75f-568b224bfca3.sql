-- job_id: 57b12850-6950-404f-b75f-568b224bfca3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:44.759000+00:00
-- started: 2026-08-03T12:37:44.850000+00:00
-- ended: 2026-08-03T12:37:45.443000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
