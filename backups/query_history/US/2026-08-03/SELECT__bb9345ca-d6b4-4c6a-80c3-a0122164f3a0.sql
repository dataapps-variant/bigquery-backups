-- job_id: bb9345ca-d6b4-4c6a-80c3-a0122164f3a0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:54.261000+00:00
-- started: 2026-08-03T09:45:54.386000+00:00
-- ended: 2026-08-03T09:45:54.615000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
