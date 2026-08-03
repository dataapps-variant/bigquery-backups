-- job_id: b5db6532-01aa-43fa-8a9c-52867203a5a6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:23.945000+00:00
-- started: 2026-08-03T13:03:24.043000+00:00
-- ended: 2026-08-03T13:03:24.360000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
