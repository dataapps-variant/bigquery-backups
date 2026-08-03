-- job_id: bb54d144-4483-497a-908c-b1c82b6a0eb4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:14.773000+00:00
-- started: 2026-08-03T12:28:14.860000+00:00
-- ended: 2026-08-03T12:28:15.063000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
