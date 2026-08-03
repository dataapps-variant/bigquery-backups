-- job_id: c4f1f617-b262-45c5-9302-a2053a37b2dd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:46:05.520000+00:00
-- started: 2026-08-03T09:46:05.648000+00:00
-- ended: 2026-08-03T09:46:05.893000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
