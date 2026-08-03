-- job_id: 1c4f00a4-aeb6-4888-975c-aeb0a694adbf
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:40.204000+00:00
-- started: 2026-08-03T09:45:40.351000+00:00
-- ended: 2026-08-03T09:45:40.609000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
