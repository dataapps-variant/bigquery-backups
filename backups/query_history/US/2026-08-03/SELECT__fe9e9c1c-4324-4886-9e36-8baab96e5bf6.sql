-- job_id: fe9e9c1c-4324-4886-9e36-8baab96e5bf6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:22.725000+00:00
-- started: 2026-08-03T10:11:22.863000+00:00
-- ended: 2026-08-03T10:11:23.097000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
