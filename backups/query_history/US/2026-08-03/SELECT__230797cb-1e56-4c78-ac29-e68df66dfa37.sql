-- job_id: 230797cb-1e56-4c78-ac29-e68df66dfa37
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:44.515000+00:00
-- started: 2026-08-03T13:02:44.625000+00:00
-- ended: 2026-08-03T13:02:44.899000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
