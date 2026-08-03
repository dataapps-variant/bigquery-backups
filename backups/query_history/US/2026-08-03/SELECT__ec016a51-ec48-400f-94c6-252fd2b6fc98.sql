-- job_id: ec016a51-ec48-400f-94c6-252fd2b6fc98
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:41.503000+00:00
-- started: 2026-08-03T12:30:41.610000+00:00
-- ended: 2026-08-03T12:30:41.880000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
