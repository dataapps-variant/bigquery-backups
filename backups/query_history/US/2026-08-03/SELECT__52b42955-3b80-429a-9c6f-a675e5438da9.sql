-- job_id: 52b42955-3b80-429a-9c6f-a675e5438da9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:54.273000+00:00
-- started: 2026-08-03T12:29:54.370000+00:00
-- ended: 2026-08-03T12:29:54.602000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
