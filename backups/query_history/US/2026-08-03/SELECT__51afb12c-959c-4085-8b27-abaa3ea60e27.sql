-- job_id: 51afb12c-959c-4085-8b27-abaa3ea60e27
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:45.463000+00:00
-- started: 2026-08-03T09:50:45.564000+00:00
-- ended: 2026-08-03T09:50:45.704000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
