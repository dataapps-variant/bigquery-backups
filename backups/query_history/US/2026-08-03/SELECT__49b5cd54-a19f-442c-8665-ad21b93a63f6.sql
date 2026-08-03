-- job_id: 49b5cd54-a19f-442c-8665-ad21b93a63f6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:42.208000+00:00
-- started: 2026-08-03T10:09:42.322000+00:00
-- ended: 2026-08-03T10:09:42.580000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
