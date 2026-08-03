-- job_id: 0926aee4-436d-4daa-976a-ee277f93c1f3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:22.915000+00:00
-- started: 2026-08-03T10:11:23.025000+00:00
-- ended: 2026-08-03T10:11:23.269000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
