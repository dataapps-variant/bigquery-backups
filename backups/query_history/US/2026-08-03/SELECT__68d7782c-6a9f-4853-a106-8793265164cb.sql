-- job_id: 68d7782c-6a9f-4853-a106-8793265164cb
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:04:43.026000+00:00
-- started: 2026-08-03T09:04:43.121000+00:00
-- ended: 2026-08-03T09:04:43.316000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
