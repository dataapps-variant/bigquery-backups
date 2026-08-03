-- job_id: db30be59-a962-423b-9a1b-2ad89ab2ce24
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:22.366000+00:00
-- started: 2026-08-03T12:30:22.532000+00:00
-- ended: 2026-08-03T12:30:22.759000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
