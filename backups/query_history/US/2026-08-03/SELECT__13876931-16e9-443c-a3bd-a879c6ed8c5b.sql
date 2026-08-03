-- job_id: 13876931-16e9-443c-a3bd-a879c6ed8c5b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:48.694000+00:00
-- started: 2026-08-03T09:12:48.867000+00:00
-- ended: 2026-08-03T09:12:49.290000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
