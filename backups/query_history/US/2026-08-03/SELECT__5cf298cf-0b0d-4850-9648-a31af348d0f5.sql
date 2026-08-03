-- job_id: 5cf298cf-0b0d-4850-9648-a31af348d0f5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:48.544000+00:00
-- started: 2026-08-03T09:50:48.628000+00:00
-- ended: 2026-08-03T09:50:48.817000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
