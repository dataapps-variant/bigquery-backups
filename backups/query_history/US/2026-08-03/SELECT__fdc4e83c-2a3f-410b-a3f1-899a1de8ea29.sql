-- job_id: fdc4e83c-2a3f-410b-a3f1-899a1de8ea29
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:18.777000+00:00
-- started: 2026-08-03T09:45:18.914000+00:00
-- ended: 2026-08-03T09:45:19.163000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
