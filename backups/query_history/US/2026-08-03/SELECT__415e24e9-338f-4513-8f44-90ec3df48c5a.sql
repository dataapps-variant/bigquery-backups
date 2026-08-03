-- job_id: 415e24e9-338f-4513-8f44-90ec3df48c5a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:45.026000+00:00
-- started: 2026-08-03T13:01:45.137000+00:00
-- ended: 2026-08-03T13:01:45.362000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
