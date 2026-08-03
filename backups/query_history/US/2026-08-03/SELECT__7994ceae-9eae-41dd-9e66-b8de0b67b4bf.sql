-- job_id: 7994ceae-9eae-41dd-9e66-b8de0b67b4bf
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:15.024000+00:00
-- started: 2026-08-03T09:45:15.147000+00:00
-- ended: 2026-08-03T09:45:15.688000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
