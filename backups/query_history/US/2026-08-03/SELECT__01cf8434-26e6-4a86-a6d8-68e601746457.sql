-- job_id: 01cf8434-26e6-4a86-a6d8-68e601746457
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:57.275000+00:00
-- started: 2026-08-03T12:29:57.386000+00:00
-- ended: 2026-08-03T12:29:57.595000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
