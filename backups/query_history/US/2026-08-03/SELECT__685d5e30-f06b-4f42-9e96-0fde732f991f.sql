-- job_id: 685d5e30-f06b-4f42-9e96-0fde732f991f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:50.706000+00:00
-- started: 2026-08-03T10:09:50.772000+00:00
-- ended: 2026-08-03T10:09:50.953000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
