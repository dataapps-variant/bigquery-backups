-- job_id: 885d2608-9bab-4386-a952-bc1c820010e6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:51.205000+00:00
-- started: 2026-08-03T12:28:51.335000+00:00
-- ended: 2026-08-03T12:28:51.568000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
