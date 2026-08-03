-- job_id: 9f32af69-896e-46e7-8702-87717277864d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:19.446000+00:00
-- started: 2026-08-03T12:30:19.525000+00:00
-- ended: 2026-08-03T12:30:19.866000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
