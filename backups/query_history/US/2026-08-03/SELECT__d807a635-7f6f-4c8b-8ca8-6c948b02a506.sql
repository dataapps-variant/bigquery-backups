-- job_id: d807a635-7f6f-4c8b-8ca8-6c948b02a506
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:48.353000+00:00
-- started: 2026-08-03T12:37:48.467000+00:00
-- ended: 2026-08-03T12:37:48.690000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
