-- job_id: 892be54b-1a90-488b-bf10-5d5d5c16180d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:30.068000+00:00
-- started: 2026-08-03T09:45:30.195000+00:00
-- ended: 2026-08-03T09:45:30.456000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
