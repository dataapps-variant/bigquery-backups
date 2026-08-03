-- job_id: 3fcdccaf-a05b-4b18-b6a8-5c6706783895
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:46.966000+00:00
-- started: 2026-08-03T09:50:47.065000+00:00
-- ended: 2026-08-03T09:50:47.322000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
