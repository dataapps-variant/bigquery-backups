-- job_id: f68f5696-93a8-404a-b449-fad6422c31d5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:25.427000+00:00
-- started: 2026-08-03T12:38:25.594000+00:00
-- ended: 2026-08-03T12:38:25.819000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
