-- job_id: 8e255ffe-9807-447a-bb86-c6b4e08b8f0e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:43.815000+00:00
-- started: 2026-08-03T09:49:43.969000+00:00
-- ended: 2026-08-03T09:49:44.207000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
