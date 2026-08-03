-- job_id: 2b0792ae-ee5c-4793-9e7b-c3544f4d02fc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:31.134000+00:00
-- started: 2026-08-03T09:49:31.291000+00:00
-- ended: 2026-08-03T09:49:31.509000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
