-- job_id: 75720939-7ddf-4ae7-94d4-62363a8c9aee
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:31.085000+00:00
-- started: 2026-08-03T11:53:31.255000+00:00
-- ended: 2026-08-03T11:53:31.465000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
