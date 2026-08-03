-- job_id: 33fcbb0f-ecee-4e3d-964c-1ffa5a384c65
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:34.226000+00:00
-- started: 2026-08-03T11:53:34.356000+00:00
-- ended: 2026-08-03T11:53:34.582000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
