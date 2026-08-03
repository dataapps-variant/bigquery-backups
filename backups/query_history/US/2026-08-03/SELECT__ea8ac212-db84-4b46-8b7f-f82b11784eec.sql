-- job_id: ea8ac212-db84-4b46-8b7f-f82b11784eec
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:47.433000+00:00
-- started: 2026-08-03T09:45:47.519000+00:00
-- ended: 2026-08-03T09:45:47.743000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
