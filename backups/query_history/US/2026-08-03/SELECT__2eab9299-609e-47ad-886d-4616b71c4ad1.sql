-- job_id: 2eab9299-609e-47ad-886d-4616b71c4ad1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:14.088000+00:00
-- started: 2026-08-03T10:09:14.169000+00:00
-- ended: 2026-08-03T10:09:14.375000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
