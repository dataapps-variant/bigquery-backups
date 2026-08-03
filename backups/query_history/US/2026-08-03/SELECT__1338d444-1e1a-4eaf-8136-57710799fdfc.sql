-- job_id: 1338d444-1e1a-4eaf-8136-57710799fdfc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:47.944000+00:00
-- started: 2026-08-03T12:28:48.073000+00:00
-- ended: 2026-08-03T12:28:48.304000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
