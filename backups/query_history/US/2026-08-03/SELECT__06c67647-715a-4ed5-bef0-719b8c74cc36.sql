-- job_id: 06c67647-715a-4ed5-bef0-719b8c74cc36
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:56.210000+00:00
-- started: 2026-08-03T09:50:56.293000+00:00
-- ended: 2026-08-03T09:50:56.550000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
