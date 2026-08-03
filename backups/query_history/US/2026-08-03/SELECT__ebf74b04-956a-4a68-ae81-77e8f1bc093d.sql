-- job_id: ebf74b04-956a-4a68-ae81-77e8f1bc093d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:46:11.147000+00:00
-- started: 2026-08-03T09:46:11.273000+00:00
-- ended: 2026-08-03T09:46:11.510000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
