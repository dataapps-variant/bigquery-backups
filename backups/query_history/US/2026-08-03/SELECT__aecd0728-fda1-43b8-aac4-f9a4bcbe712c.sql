-- job_id: aecd0728-fda1-43b8-aac4-f9a4bcbe712c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:02.471000+00:00
-- started: 2026-08-03T09:51:02.597000+00:00
-- ended: 2026-08-03T09:51:02.827000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
