-- job_id: c98df699-4219-4eac-9d62-195c8afce57b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:03.289000+00:00
-- started: 2026-08-03T12:30:03.391000+00:00
-- ended: 2026-08-03T12:30:03.698000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
