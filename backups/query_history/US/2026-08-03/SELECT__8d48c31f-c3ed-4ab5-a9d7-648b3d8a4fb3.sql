-- job_id: 8d48c31f-c3ed-4ab5-a9d7-648b3d8a4fb3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:00.215000+00:00
-- started: 2026-08-03T12:30:00.337000+00:00
-- ended: 2026-08-03T12:30:00.580000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
