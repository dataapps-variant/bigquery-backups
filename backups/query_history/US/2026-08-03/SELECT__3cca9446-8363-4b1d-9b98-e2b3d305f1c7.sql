-- job_id: 3cca9446-8363-4b1d-9b98-e2b3d305f1c7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:50.116000+00:00
-- started: 2026-08-03T09:49:50.217000+00:00
-- ended: 2026-08-03T09:49:50.457000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
