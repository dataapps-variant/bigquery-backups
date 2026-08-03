-- job_id: fdf44a01-228f-48f3-b711-be20e0422083
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:48.177000+00:00
-- started: 2026-08-03T10:10:48.276000+00:00
-- ended: 2026-08-03T10:10:48.491000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
