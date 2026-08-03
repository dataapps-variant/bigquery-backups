-- job_id: 646ada3d-4eb1-4ce9-8ad9-cbc280c07e61
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:00.150000+00:00
-- started: 2026-08-03T12:37:00.260000+00:00
-- ended: 2026-08-03T12:37:00.519000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
