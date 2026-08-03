-- job_id: 461eecc6-42cf-4840-a2e0-5a35c2d4e49d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:16.746000+00:00
-- started: 2026-08-03T10:11:16.881000+00:00
-- ended: 2026-08-03T10:11:17.091000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
