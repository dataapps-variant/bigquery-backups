-- job_id: 4b8ee2cb-c29f-473d-97f9-641112ccd37d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:48.921000+00:00
-- started: 2026-08-03T12:38:49.020000+00:00
-- ended: 2026-08-03T12:38:49.234000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
