-- job_id: 2e722f40-d17a-4040-b0a5-2fdb0bfb987f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:27.487000+00:00
-- started: 2026-08-03T09:49:27.606000+00:00
-- ended: 2026-08-03T09:49:27.834000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
