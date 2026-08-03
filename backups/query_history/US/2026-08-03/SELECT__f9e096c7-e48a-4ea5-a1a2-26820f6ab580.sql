-- job_id: f9e096c7-e48a-4ea5-a1a2-26820f6ab580
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:10.651000+00:00
-- started: 2026-08-03T13:02:10.805000+00:00
-- ended: 2026-08-03T13:02:11.090000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
