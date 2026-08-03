-- job_id: 6a5b67f6-5896-4d92-baa3-aff178bdbe3b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:04.007000+00:00
-- started: 2026-08-03T10:09:04.151000+00:00
-- ended: 2026-08-03T10:09:04.418000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
