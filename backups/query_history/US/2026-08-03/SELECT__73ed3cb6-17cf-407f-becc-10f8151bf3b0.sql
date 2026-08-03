-- job_id: 73ed3cb6-17cf-407f-becc-10f8151bf3b0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:40.894000+00:00
-- started: 2026-08-03T09:50:40.999000+00:00
-- ended: 2026-08-03T09:50:41.244000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
