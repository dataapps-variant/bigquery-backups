-- job_id: 0be167da-893e-4ee8-bde9-aa66397e80a2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:38.538000+00:00
-- started: 2026-08-03T09:45:38.629000+00:00
-- ended: 2026-08-03T09:45:38.861000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
