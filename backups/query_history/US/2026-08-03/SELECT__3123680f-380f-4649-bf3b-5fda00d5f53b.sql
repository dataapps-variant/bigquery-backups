-- job_id: 3123680f-380f-4649-bf3b-5fda00d5f53b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:59.072000+00:00
-- started: 2026-08-03T10:10:59.160000+00:00
-- ended: 2026-08-03T10:10:59.377000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
