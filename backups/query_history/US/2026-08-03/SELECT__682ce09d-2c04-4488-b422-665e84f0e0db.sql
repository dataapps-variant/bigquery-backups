-- job_id: 682ce09d-2c04-4488-b422-665e84f0e0db
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:01.774000+00:00
-- started: 2026-08-03T12:37:01.862000+00:00
-- ended: 2026-08-03T12:37:02.087000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
