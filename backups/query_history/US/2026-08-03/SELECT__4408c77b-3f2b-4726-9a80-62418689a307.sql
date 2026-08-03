-- job_id: 4408c77b-3f2b-4726-9a80-62418689a307
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:44:56.244000+00:00
-- started: 2026-08-03T09:44:56.386000+00:00
-- ended: 2026-08-03T09:44:56.662000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
