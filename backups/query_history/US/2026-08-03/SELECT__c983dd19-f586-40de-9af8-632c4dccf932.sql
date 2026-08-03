-- job_id: c983dd19-f586-40de-9af8-632c4dccf932
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:29.788000+00:00
-- started: 2026-08-03T11:51:29.899000+00:00
-- ended: 2026-08-03T11:51:30.094000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
