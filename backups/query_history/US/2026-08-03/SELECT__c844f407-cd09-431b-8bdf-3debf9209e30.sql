-- job_id: c844f407-cd09-431b-8bdf-3debf9209e30
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:01.735000+00:00
-- started: 2026-08-03T11:53:01.846000+00:00
-- ended: 2026-08-03T11:53:02.075000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
