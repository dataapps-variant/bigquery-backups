-- job_id: 2af9841e-a96b-4a26-be01-c87646df0803
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:33.191000+00:00
-- started: 2026-08-03T13:01:33.310000+00:00
-- ended: 2026-08-03T13:01:33.557000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
