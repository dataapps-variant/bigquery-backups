-- job_id: c274ae99-0d79-42af-a0dd-da2f4e060a6f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:35.096000+00:00
-- started: 2026-08-03T09:45:35.243000+00:00
-- ended: 2026-08-03T09:45:35.479000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
