-- job_id: e62a4fc3-2c53-4e55-b9cf-15e748aac95c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:59.338000+00:00
-- started: 2026-08-03T10:09:59.443000+00:00
-- ended: 2026-08-03T10:09:59.690000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
