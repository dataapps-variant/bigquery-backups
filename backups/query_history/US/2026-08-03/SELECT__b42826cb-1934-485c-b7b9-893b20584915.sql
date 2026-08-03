-- job_id: b42826cb-1934-485c-b7b9-893b20584915
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:43.745000+00:00
-- started: 2026-08-03T10:08:43.913000+00:00
-- ended: 2026-08-03T10:08:44.178000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
