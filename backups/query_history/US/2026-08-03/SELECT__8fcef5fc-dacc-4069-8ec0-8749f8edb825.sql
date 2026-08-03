-- job_id: 8fcef5fc-dacc-4069-8ec0-8749f8edb825
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:36.082000+00:00
-- started: 2026-08-03T09:49:36.188000+00:00
-- ended: 2026-08-03T09:49:36.357000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
