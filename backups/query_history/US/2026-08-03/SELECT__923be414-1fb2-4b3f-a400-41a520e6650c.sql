-- job_id: 923be414-1fb2-4b3f-a400-41a520e6650c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:43.095000+00:00
-- started: 2026-08-03T13:02:43.158000+00:00
-- ended: 2026-08-03T13:02:43.359000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
