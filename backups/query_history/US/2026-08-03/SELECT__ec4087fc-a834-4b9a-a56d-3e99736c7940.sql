-- job_id: ec4087fc-a834-4b9a-a56d-3e99736c7940
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:58.536000+00:00
-- started: 2026-08-03T11:52:58.665000+00:00
-- ended: 2026-08-03T11:52:58.948000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
