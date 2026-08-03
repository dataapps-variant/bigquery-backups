-- job_id: 1f33d06f-552b-4cc3-b2ff-f0700fad3d2a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:15.808000+00:00
-- started: 2026-08-03T13:03:15.973000+00:00
-- ended: 2026-08-03T13:03:16.244000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
