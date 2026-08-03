-- job_id: 4830a72b-1c99-4d2b-82c9-8e11fdf86a8d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:56.579000+00:00
-- started: 2026-08-03T10:10:56.624000+00:00
-- ended: 2026-08-03T10:10:56.827000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
