-- job_id: 090c5413-559f-437f-8415-aa375d89d6a7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:59.262000+00:00
-- started: 2026-08-03T10:09:59.375000+00:00
-- ended: 2026-08-03T10:09:59.634000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
