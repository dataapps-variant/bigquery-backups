-- job_id: cfd2208a-9840-464f-91b3-d62f9cc209ff
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:55.789000+00:00
-- started: 2026-08-03T11:51:55.887000+00:00
-- ended: 2026-08-03T11:51:56.074000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
