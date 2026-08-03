-- job_id: d6e1b770-b1a9-4d3e-8f9b-89e106370187
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:09.651000+00:00
-- started: 2026-08-03T12:29:09.750000+00:00
-- ended: 2026-08-03T12:29:10.036000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
