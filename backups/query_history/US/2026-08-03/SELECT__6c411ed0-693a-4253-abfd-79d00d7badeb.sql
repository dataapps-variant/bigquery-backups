-- job_id: 6c411ed0-693a-4253-abfd-79d00d7badeb
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:27.983000+00:00
-- started: 2026-08-03T11:51:28.123000+00:00
-- ended: 2026-08-03T11:51:28.461000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
