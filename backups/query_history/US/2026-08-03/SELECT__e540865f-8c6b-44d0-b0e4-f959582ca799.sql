-- job_id: e540865f-8c6b-44d0-b0e4-f959582ca799
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:57.782000+00:00
-- started: 2026-08-03T09:45:57.893000+00:00
-- ended: 2026-08-03T09:45:58.168000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
