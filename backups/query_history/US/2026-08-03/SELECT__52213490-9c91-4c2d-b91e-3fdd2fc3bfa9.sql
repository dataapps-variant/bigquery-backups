-- job_id: 52213490-9c91-4c2d-b91e-3fdd2fc3bfa9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:44:50.186000+00:00
-- started: 2026-08-03T09:44:50.333000+00:00
-- ended: 2026-08-03T09:44:50.599000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
