-- job_id: 93d6840d-450f-4aca-b4a7-62a54690afbf
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:09:58.395000+00:00
-- started: 2026-08-03T09:09:58.487000+00:00
-- ended: 2026-08-03T09:09:58.688000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
