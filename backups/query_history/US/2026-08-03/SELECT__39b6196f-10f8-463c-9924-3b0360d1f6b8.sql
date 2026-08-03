-- job_id: 39b6196f-10f8-463c-9924-3b0360d1f6b8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:10.759000+00:00
-- started: 2026-08-03T09:45:10.888000+00:00
-- ended: 2026-08-03T09:45:11.179000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
