-- job_id: f8914b9e-a979-4cf5-a666-0878a3c855a0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:31.786000+00:00
-- started: 2026-08-03T09:45:31.901000+00:00
-- ended: 2026-08-03T09:45:32.133000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
