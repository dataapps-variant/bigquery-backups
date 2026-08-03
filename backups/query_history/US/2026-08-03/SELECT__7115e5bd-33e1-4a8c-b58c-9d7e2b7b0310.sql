-- job_id: 7115e5bd-33e1-4a8c-b58c-9d7e2b7b0310
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:45.388000+00:00
-- started: 2026-08-03T09:49:45.474000+00:00
-- ended: 2026-08-03T09:49:45.651000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
