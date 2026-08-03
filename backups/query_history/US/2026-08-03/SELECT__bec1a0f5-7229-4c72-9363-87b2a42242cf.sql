-- job_id: bec1a0f5-7229-4c72-9363-87b2a42242cf
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:44:54.309000+00:00
-- started: 2026-08-03T09:44:54.434000+00:00
-- ended: 2026-08-03T09:44:54.643000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
