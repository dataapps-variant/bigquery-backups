-- job_id: bbfca9d6-3bc1-4c6a-9cf7-d8fdc3aa91a4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:31.602000+00:00
-- started: 2026-08-03T12:28:31.680000+00:00
-- ended: 2026-08-03T12:28:31.886000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
