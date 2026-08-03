-- job_id: c3e3ad6d-595f-4acc-ae13-998eb8fbb5a8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:46:01.115000+00:00
-- started: 2026-08-03T09:46:01.230000+00:00
-- ended: 2026-08-03T09:46:01.510000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
