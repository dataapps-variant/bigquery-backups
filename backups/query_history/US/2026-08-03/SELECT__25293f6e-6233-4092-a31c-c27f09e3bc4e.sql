-- job_id: 25293f6e-6233-4092-a31c-c27f09e3bc4e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:01.856000+00:00
-- started: 2026-08-03T09:45:01.972000+00:00
-- ended: 2026-08-03T09:45:02.196000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
