-- job_id: d0e8f8e8-c1ac-4d41-9209-81303e73c247
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:21.108000+00:00
-- started: 2026-08-03T13:02:21.214000+00:00
-- ended: 2026-08-03T13:02:21.466000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
