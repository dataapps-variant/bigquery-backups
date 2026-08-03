-- job_id: 65f34e43-1358-470d-b674-bde72a505fa9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:47.177000+00:00
-- started: 2026-08-03T09:31:47.306000+00:00
-- ended: 2026-08-03T09:31:47.558000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
