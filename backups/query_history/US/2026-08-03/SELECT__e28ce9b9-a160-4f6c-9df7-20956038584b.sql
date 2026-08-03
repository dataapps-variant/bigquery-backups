-- job_id: e28ce9b9-a160-4f6c-9df7-20956038584b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:16.497000+00:00
-- started: 2026-08-03T10:11:16.624000+00:00
-- ended: 2026-08-03T10:11:16.840000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
