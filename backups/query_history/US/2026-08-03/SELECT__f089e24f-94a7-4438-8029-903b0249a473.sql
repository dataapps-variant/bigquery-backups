-- job_id: f089e24f-94a7-4438-8029-903b0249a473
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:58.080000+00:00
-- started: 2026-08-03T09:48:58.200000+00:00
-- ended: 2026-08-03T09:48:58.414000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
