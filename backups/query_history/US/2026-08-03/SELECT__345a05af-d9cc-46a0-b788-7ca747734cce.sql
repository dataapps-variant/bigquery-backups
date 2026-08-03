-- job_id: 345a05af-d9cc-46a0-b788-7ca747734cce
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:04.702000+00:00
-- started: 2026-08-03T10:11:04.772000+00:00
-- ended: 2026-08-03T10:11:05.023000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
