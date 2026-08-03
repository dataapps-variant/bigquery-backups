-- job_id: 6635c580-99dc-4991-b3e9-9d6fba6b736e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:43.214000+00:00
-- started: 2026-08-03T12:30:43.300000+00:00
-- ended: 2026-08-03T12:30:43.558000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
