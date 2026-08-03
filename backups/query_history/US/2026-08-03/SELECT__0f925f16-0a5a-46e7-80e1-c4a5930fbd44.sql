-- job_id: 0f925f16-0a5a-46e7-80e1-c4a5930fbd44
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:47.867000+00:00
-- started: 2026-08-03T09:05:47.962000+00:00
-- ended: 2026-08-03T09:05:48.176000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
