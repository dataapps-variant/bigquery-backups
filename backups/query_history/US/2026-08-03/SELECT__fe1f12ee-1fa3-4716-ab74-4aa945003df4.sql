-- job_id: fe1f12ee-1fa3-4716-ab74-4aa945003df4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:55.898000+00:00
-- started: 2026-08-03T10:10:55.973000+00:00
-- ended: 2026-08-03T10:10:56.240000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
