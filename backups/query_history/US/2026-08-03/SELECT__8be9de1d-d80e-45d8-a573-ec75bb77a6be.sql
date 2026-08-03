-- job_id: 8be9de1d-d80e-45d8-a573-ec75bb77a6be
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:17.024000+00:00
-- started: 2026-08-03T09:45:17.143000+00:00
-- ended: 2026-08-03T09:45:17.410000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
