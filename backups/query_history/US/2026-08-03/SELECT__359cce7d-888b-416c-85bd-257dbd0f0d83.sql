-- job_id: 359cce7d-888b-416c-85bd-257dbd0f0d83
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:02.446000+00:00
-- started: 2026-08-03T10:10:02.585000+00:00
-- ended: 2026-08-03T10:10:03.185000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
