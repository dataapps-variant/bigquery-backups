-- job_id: d5842fa9-5df1-40c8-a6ef-411dd0e6668c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:49.694000+00:00
-- started: 2026-08-03T12:28:49.818000+00:00
-- ended: 2026-08-03T12:28:49.996000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
