-- job_id: 1f6cec8a-3612-4561-a5c0-fc3a0f4d8cf4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:09.214000+00:00
-- started: 2026-08-03T10:11:09.308000+00:00
-- ended: 2026-08-03T10:11:09.539000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
