-- job_id: 1178591c-f3de-4dd9-9ecc-b519fd93bda7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:44.157000+00:00
-- started: 2026-08-03T11:53:44.272000+00:00
-- ended: 2026-08-03T11:53:44.515000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
