-- job_id: 690650d8-34fb-4c97-a786-1ab0a7fe4f7b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:09.901000+00:00
-- started: 2026-08-03T09:49:09.969000+00:00
-- ended: 2026-08-03T09:49:10.147000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
