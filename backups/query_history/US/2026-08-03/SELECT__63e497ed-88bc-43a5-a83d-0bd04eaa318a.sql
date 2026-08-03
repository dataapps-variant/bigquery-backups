-- job_id: 63e497ed-88bc-43a5-a83d-0bd04eaa318a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:08.274000+00:00
-- started: 2026-08-03T09:49:08.401000+00:00
-- ended: 2026-08-03T09:49:08.615000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
