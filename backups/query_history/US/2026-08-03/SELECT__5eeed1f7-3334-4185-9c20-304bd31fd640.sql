-- job_id: 5eeed1f7-3334-4185-9c20-304bd31fd640
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:20.571000+00:00
-- started: 2026-08-03T11:53:20.668000+00:00
-- ended: 2026-08-03T11:53:20.913000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
