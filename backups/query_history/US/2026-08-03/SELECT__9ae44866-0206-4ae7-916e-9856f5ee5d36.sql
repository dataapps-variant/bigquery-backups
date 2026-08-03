-- job_id: 9ae44866-0206-4ae7-916e-9856f5ee5d36
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:12.796000+00:00
-- started: 2026-08-03T09:45:12.929000+00:00
-- ended: 2026-08-03T09:45:13.188000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
