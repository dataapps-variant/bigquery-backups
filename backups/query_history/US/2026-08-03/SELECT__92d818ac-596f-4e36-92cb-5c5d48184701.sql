-- job_id: 92d818ac-596f-4e36-92cb-5c5d48184701
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:39:08.050000+00:00
-- started: 2026-08-03T12:39:08.169000+00:00
-- ended: 2026-08-03T12:39:08.391000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
