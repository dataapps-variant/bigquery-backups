-- job_id: 1d361855-11ec-48b2-8791-50a60fee3626
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:25.908000+00:00
-- started: 2026-08-03T13:03:26.032000+00:00
-- ended: 2026-08-03T13:03:26.279000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
