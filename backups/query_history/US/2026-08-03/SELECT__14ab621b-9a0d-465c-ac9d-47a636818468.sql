-- job_id: 14ab621b-9a0d-465c-ac9d-47a636818468
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:03.424000+00:00
-- started: 2026-08-03T10:11:03.482000+00:00
-- ended: 2026-08-03T10:11:03.627000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
