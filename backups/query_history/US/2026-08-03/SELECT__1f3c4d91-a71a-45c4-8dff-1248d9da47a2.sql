-- job_id: 1f3c4d91-a71a-45c4-8dff-1248d9da47a2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:13.082000+00:00
-- started: 2026-08-03T09:10:13.195000+00:00
-- ended: 2026-08-03T09:10:13.384000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
