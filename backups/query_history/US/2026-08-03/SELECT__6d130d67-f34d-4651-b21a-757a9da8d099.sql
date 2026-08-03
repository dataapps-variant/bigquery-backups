-- job_id: 6d130d67-f34d-4651-b21a-757a9da8d099
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:37.518000+00:00
-- started: 2026-08-03T12:36:37.727000+00:00
-- ended: 2026-08-03T12:36:37.954000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
