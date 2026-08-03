-- job_id: 7bf497f8-24f9-4730-8981-3f1b0f41eb5a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:16.535000+00:00
-- started: 2026-08-03T12:29:16.639000+00:00
-- ended: 2026-08-03T12:29:16.888000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
