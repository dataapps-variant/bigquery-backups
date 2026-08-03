-- job_id: 42922c02-1e6c-4b92-b636-f81046a797aa
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:03.521000+00:00
-- started: 2026-08-03T09:50:03.635000+00:00
-- ended: 2026-08-03T09:50:03.924000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
