-- job_id: 057628ca-8ddb-4cf7-93fc-bc2cde24e2e3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:56.220000+00:00
-- started: 2026-08-03T09:45:56.358000+00:00
-- ended: 2026-08-03T09:45:56.573000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
