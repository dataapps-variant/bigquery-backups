-- job_id: 4e9a5c7b-b451-47ab-a88f-c6c82ba9c24e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:34.169000+00:00
-- started: 2026-08-03T12:38:34.264000+00:00
-- ended: 2026-08-03T12:38:34.516000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
