-- job_id: 14dbcc88-4a67-44c7-b7f4-0870429ce532
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:45.241000+00:00
-- started: 2026-08-03T12:29:45.436000+00:00
-- ended: 2026-08-03T12:29:45.651000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
