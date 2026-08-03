-- job_id: ad9b8a9e-1b26-4604-9cb8-8f2bfc8f4470
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:12.939000+00:00
-- started: 2026-08-03T10:11:13.175000+00:00
-- ended: 2026-08-03T10:11:13.392000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
