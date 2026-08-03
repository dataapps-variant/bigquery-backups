-- job_id: db074270-58b3-427f-823d-bec90cd6792f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:28.262000+00:00
-- started: 2026-08-03T09:45:28.418000+00:00
-- ended: 2026-08-03T09:45:28.696000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
