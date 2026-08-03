-- job_id: a187929e-3dd0-4179-859b-ada9279235cb
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:55.799000+00:00
-- started: 2026-08-03T12:28:55.859000+00:00
-- ended: 2026-08-03T12:28:56.048000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
