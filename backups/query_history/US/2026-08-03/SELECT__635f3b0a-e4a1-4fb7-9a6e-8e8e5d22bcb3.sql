-- job_id: 635f3b0a-e4a1-4fb7-9a6e-8e8e5d22bcb3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:43.328000+00:00
-- started: 2026-08-03T09:13:43.408000+00:00
-- ended: 2026-08-03T09:13:43.587000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
