-- job_id: 5c37bc33-5b00-4343-bb14-65719e2c16fd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:26.580000+00:00
-- started: 2026-08-03T09:45:26.685000+00:00
-- ended: 2026-08-03T09:45:26.929000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
