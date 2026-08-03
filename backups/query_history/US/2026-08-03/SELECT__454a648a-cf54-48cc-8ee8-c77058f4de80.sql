-- job_id: 454a648a-cf54-48cc-8ee8-c77058f4de80
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:18.137000+00:00
-- started: 2026-08-03T13:01:18.281000+00:00
-- ended: 2026-08-03T13:01:18.725000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
