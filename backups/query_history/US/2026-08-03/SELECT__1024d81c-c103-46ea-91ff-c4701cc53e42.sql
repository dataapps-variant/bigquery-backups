-- job_id: 1024d81c-c103-46ea-91ff-c4701cc53e42
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:12.021000+00:00
-- started: 2026-08-03T10:09:12.138000+00:00
-- ended: 2026-08-03T10:09:12.417000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
