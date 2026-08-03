-- job_id: 12e61d56-d58b-48ec-af61-a3dd38a6ca30
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:39.919000+00:00
-- started: 2026-08-03T09:32:40.041000+00:00
-- ended: 2026-08-03T09:32:40.221000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
