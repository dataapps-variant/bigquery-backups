-- job_id: dc7f6d57-df9c-424c-9314-35fe84dfe03f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:52.617000+00:00
-- started: 2026-08-03T10:10:52.711000+00:00
-- ended: 2026-08-03T10:10:52.939000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
