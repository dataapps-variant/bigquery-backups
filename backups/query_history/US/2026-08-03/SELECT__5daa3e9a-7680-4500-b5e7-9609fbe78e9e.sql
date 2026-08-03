-- job_id: 5daa3e9a-7680-4500-b5e7-9609fbe78e9e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:42.630000+00:00
-- started: 2026-08-03T09:48:42.710000+00:00
-- ended: 2026-08-03T09:48:42.886000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
