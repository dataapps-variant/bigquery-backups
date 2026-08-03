-- job_id: bc4e31b1-0240-4ed1-8199-cb0fca96ff72
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:09.038000+00:00
-- started: 2026-08-03T13:03:09.159000+00:00
-- ended: 2026-08-03T13:03:09.443000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
