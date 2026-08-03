-- job_id: 1ffa98da-87a3-4113-851f-82784000f6b9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:13.244000+00:00
-- started: 2026-08-03T10:10:13.377000+00:00
-- ended: 2026-08-03T10:10:13.675000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
