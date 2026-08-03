-- job_id: 70a5a524-b02a-47a2-9a10-8f521a92f5c8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:47.711000+00:00
-- started: 2026-08-03T11:53:47.824000+00:00
-- ended: 2026-08-03T11:53:48.087000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
