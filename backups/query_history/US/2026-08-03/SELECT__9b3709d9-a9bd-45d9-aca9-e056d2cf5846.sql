-- job_id: 9b3709d9-a9bd-45d9-aca9-e056d2cf5846
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:37.221000+00:00
-- started: 2026-08-03T12:38:37.334000+00:00
-- ended: 2026-08-03T12:38:37.543000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
