-- job_id: 0d49dc3f-6157-47dc-8a27-f1d9a571954a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:50.879000+00:00
-- started: 2026-08-03T11:51:51.019000+00:00
-- ended: 2026-08-03T11:51:51.281000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
