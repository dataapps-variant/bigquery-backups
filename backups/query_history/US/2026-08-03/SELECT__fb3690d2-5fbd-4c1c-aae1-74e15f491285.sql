-- job_id: fb3690d2-5fbd-4c1c-aae1-74e15f491285
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:05.136000+00:00
-- started: 2026-08-03T09:45:05.256000+00:00
-- ended: 2026-08-03T09:45:05.579000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
