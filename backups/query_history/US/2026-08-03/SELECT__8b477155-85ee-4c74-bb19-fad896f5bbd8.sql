-- job_id: 8b477155-85ee-4c74-bb19-fad896f5bbd8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:09.907000+00:00
-- started: 2026-08-03T09:05:09.996000+00:00
-- ended: 2026-08-03T09:05:10.199000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
