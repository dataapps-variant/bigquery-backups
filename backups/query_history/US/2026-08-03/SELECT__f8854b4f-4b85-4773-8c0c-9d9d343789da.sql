-- job_id: f8854b4f-4b85-4773-8c0c-9d9d343789da
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:31.270000+00:00
-- started: 2026-08-03T12:38:31.361000+00:00
-- ended: 2026-08-03T12:38:31.619000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
