-- job_id: 5ab5fdaf-b7d5-4c09-9360-d81f2ffa9f12
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:16.761000+00:00
-- started: 2026-08-03T10:09:16.868000+00:00
-- ended: 2026-08-03T10:09:17.118000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
