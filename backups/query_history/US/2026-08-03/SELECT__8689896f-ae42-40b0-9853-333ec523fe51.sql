-- job_id: 8689896f-ae42-40b0-9853-333ec523fe51
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:30.078000+00:00
-- started: 2026-08-03T12:28:30.154000+00:00
-- ended: 2026-08-03T12:28:30.407000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
