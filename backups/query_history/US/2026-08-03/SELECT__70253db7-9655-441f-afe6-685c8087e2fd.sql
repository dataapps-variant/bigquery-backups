-- job_id: 70253db7-9655-441f-afe6-685c8087e2fd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:25.611000+00:00
-- started: 2026-08-03T09:51:25.709000+00:00
-- ended: 2026-08-03T09:51:26.057000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
