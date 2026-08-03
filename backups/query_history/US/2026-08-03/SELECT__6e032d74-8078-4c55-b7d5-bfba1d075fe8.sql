-- job_id: 6e032d74-8078-4c55-b7d5-bfba1d075fe8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:54.684000+00:00
-- started: 2026-08-03T12:38:54.803000+00:00
-- ended: 2026-08-03T12:38:55.025000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
