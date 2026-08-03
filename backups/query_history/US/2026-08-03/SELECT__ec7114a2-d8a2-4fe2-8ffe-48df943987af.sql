-- job_id: ec7114a2-d8a2-4fe2-8ffe-48df943987af
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:45.938000+00:00
-- started: 2026-08-03T12:38:46.093000+00:00
-- ended: 2026-08-03T12:38:46.296000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
