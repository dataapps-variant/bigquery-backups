-- job_id: 2ceb163d-b3a3-412a-8819-28955e715ed0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:28.387000+00:00
-- started: 2026-08-03T12:38:28.512000+00:00
-- ended: 2026-08-03T12:38:28.723000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
