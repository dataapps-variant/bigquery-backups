-- job_id: 5adc8111-30cd-4630-9ad8-eaec40093fed
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:29.538000+00:00
-- started: 2026-08-03T12:37:29.633000+00:00
-- ended: 2026-08-03T12:37:29.899000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
