-- job_id: ee808a86-ecfc-4972-b902-346d2c59f183
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:22.333000+00:00
-- started: 2026-08-03T13:03:22.473000+00:00
-- ended: 2026-08-03T13:03:22.746000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
