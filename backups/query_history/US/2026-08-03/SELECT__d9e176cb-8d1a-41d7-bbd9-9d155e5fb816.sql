-- job_id: d9e176cb-8d1a-41d7-bbd9-9d155e5fb816
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:04.877000+00:00
-- started: 2026-08-03T11:53:04.973000+00:00
-- ended: 2026-08-03T11:53:05.217000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
