-- job_id: 3e79d9df-6240-4c73-803a-cc6d2f6df156
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:11:11.067000+00:00
-- started: 2026-08-03T09:11:11.167000+00:00
-- ended: 2026-08-03T09:11:11.321000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
