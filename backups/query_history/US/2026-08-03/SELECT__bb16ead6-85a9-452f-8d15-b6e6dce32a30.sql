-- job_id: bb16ead6-85a9-452f-8d15-b6e6dce32a30
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:37.836000+00:00
-- started: 2026-08-03T09:50:37.954000+00:00
-- ended: 2026-08-03T09:50:38.177000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
