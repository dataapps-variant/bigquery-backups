-- job_id: 4fcece98-702f-433c-8019-740263acee3f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:24.797000+00:00
-- started: 2026-08-03T09:45:25.055000+00:00
-- ended: 2026-08-03T09:45:25.316000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
