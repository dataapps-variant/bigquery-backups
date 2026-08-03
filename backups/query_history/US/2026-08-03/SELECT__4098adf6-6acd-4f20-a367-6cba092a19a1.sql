-- job_id: 4098adf6-6acd-4f20-a367-6cba092a19a1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:21.690000+00:00
-- started: 2026-08-03T09:12:21.793000+00:00
-- ended: 2026-08-03T09:12:21.959000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
