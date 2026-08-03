-- job_id: f883f7aa-c452-4ab7-b2e0-a48ac378c7bd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:51.867000+00:00
-- started: 2026-08-03T10:10:51.960000+00:00
-- ended: 2026-08-03T10:10:52.201000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
