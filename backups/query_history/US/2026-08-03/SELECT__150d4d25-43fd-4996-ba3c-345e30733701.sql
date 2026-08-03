-- job_id: 150d4d25-43fd-4996-ba3c-345e30733701
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:24.060000+00:00
-- started: 2026-08-03T09:51:24.147000+00:00
-- ended: 2026-08-03T09:51:24.335000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
