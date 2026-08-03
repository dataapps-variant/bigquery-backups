-- job_id: 6501648b-4d77-4098-9999-1f69075b2bdc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:04.351000+00:00
-- started: 2026-08-03T12:28:04.449000+00:00
-- ended: 2026-08-03T12:28:04.732000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
