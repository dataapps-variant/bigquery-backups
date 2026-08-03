-- job_id: 4421cdc0-5ee9-4d18-8400-3eb35985b624
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:07.606000+00:00
-- started: 2026-08-03T12:28:07.722000+00:00
-- ended: 2026-08-03T12:28:08.218000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
