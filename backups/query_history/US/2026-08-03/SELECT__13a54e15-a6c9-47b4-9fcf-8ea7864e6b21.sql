-- job_id: 13a54e15-a6c9-47b4-9fcf-8ea7864e6b21
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:36.788000+00:00
-- started: 2026-08-03T09:45:36.916000+00:00
-- ended: 2026-08-03T09:45:37.175000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
