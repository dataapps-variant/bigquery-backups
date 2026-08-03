-- job_id: f09d9c7a-8d59-43c2-a7fa-23f943d33b7a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:40.661000+00:00
-- started: 2026-08-03T09:48:40.819000+00:00
-- ended: 2026-08-03T09:48:41.066000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
