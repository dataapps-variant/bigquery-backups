-- job_id: 5dfb50d3-5656-4a83-80c4-9a6429bc88d0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:04.937000+00:00
-- started: 2026-08-03T09:32:05.029000+00:00
-- ended: 2026-08-03T09:32:05.239000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
