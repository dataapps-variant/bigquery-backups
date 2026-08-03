-- job_id: 198bf20b-2cb1-4c41-b82b-671b6cc3eecb
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:12.413000+00:00
-- started: 2026-08-03T13:02:12.499000+00:00
-- ended: 2026-08-03T13:02:12.694000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
