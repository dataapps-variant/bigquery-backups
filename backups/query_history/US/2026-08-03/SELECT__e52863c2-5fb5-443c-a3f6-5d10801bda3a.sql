-- job_id: e52863c2-5fb5-443c-a3f6-5d10801bda3a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:22.002000+00:00
-- started: 2026-08-03T10:09:22.101000+00:00
-- ended: 2026-08-03T10:09:22.346000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
