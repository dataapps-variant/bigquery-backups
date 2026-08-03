-- job_id: c7b4b527-b02c-4593-a214-9b286e1f1404
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:33.834000+00:00
-- started: 2026-08-03T09:12:33.929000+00:00
-- ended: 2026-08-03T09:12:34.094000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
