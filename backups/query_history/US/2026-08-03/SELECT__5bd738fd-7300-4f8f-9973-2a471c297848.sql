-- job_id: 5bd738fd-7300-4f8f-9973-2a471c297848
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:19.085000+00:00
-- started: 2026-08-03T13:03:19.237000+00:00
-- ended: 2026-08-03T13:03:19.496000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
