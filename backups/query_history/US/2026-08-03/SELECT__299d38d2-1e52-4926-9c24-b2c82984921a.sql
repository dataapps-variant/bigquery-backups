-- job_id: 299d38d2-1e52-4926-9c24-b2c82984921a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:20.932000+00:00
-- started: 2026-08-03T12:28:21.085000+00:00
-- ended: 2026-08-03T12:28:21.469000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
