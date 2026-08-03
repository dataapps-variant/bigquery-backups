-- job_id: 61928ca0-fc65-42ba-bebb-8f4d2f7ede5e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:04:04.910000+00:00
-- started: 2026-08-03T13:04:05.039000+00:00
-- ended: 2026-08-03T13:04:05.308000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
