-- job_id: 6e9375b3-eb45-4f53-81da-fab506b9b623
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:41.629000+00:00
-- started: 2026-08-03T12:37:41.760000+00:00
-- ended: 2026-08-03T12:37:42.101000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
