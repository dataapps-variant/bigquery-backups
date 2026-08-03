-- job_id: 7b169c07-c821-4b67-a2fd-5bcaa09d68af
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:43.264000+00:00
-- started: 2026-08-03T13:01:43.451000+00:00
-- ended: 2026-08-03T13:01:43.748000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
