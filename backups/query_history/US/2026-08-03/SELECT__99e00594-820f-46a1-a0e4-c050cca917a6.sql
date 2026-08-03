-- job_id: 99e00594-820f-46a1-a0e4-c050cca917a6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:24.565000+00:00
-- started: 2026-08-03T11:51:24.713000+00:00
-- ended: 2026-08-03T11:51:25.001000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
