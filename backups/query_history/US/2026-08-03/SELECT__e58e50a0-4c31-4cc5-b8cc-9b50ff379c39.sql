-- job_id: e58e50a0-4c31-4cc5-b8cc-9b50ff379c39
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:04:54.475000+00:00
-- started: 2026-08-03T09:04:54.608000+00:00
-- ended: 2026-08-03T09:04:54.787000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
