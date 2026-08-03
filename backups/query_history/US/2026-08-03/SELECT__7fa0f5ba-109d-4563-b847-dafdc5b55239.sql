-- job_id: 7fa0f5ba-109d-4563-b847-dafdc5b55239
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:44:52.193000+00:00
-- started: 2026-08-03T09:44:52.334000+00:00
-- ended: 2026-08-03T09:44:52.607000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
