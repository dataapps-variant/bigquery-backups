-- job_id: 31eea064-2b12-4ebd-a6fe-6ff434d889c0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:27.594000+00:00
-- started: 2026-08-03T13:03:27.711000+00:00
-- ended: 2026-08-03T13:03:28.046000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
