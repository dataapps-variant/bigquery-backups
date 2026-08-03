-- job_id: 56f47aa8-9c05-4b1c-a3cc-421e2d353c8e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:27.657000+00:00
-- started: 2026-08-03T13:02:27.794000+00:00
-- ended: 2026-08-03T13:02:28.082000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
