-- job_id: 2df129f7-a57b-4150-aed4-a73aa4cb1074
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:22.051000+00:00
-- started: 2026-08-03T10:10:22.148000+00:00
-- ended: 2026-08-03T10:10:22.456000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
