-- job_id: 55351824-db02-4a2f-9682-ebd77a997d1e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:33.404000+00:00
-- started: 2026-08-03T09:45:33.522000+00:00
-- ended: 2026-08-03T09:45:33.780000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
