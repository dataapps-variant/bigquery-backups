-- job_id: 75357de6-93b1-4063-9ec7-a05b118f8d82
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:29.583000+00:00
-- started: 2026-08-03T09:49:29.658000+00:00
-- ended: 2026-08-03T09:49:29.836000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
