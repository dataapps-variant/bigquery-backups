-- job_id: e5675fd0-73a1-495b-8e14-6ecd7bc29f43
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:24.940000+00:00
-- started: 2026-08-03T10:10:25.050000+00:00
-- ended: 2026-08-03T10:10:25.256000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
