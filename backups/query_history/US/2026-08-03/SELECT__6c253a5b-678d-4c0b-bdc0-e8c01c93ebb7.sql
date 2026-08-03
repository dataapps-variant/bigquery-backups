-- job_id: 6c253a5b-678d-4c0b-bdc0-e8c01c93ebb7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:09.670000+00:00
-- started: 2026-08-03T11:53:09.734000+00:00
-- ended: 2026-08-03T11:53:09.914000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
