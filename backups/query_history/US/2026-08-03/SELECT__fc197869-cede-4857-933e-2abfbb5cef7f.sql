-- job_id: fc197869-cede-4857-933e-2abfbb5cef7f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:24.326000+00:00
-- started: 2026-08-03T13:02:24.449000+00:00
-- ended: 2026-08-03T13:02:24.807000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
