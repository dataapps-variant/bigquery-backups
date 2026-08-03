-- job_id: 981fb4a2-2c55-4b70-8943-a624c10ba66b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:21.270000+00:00
-- started: 2026-08-03T09:32:21.397000+00:00
-- ended: 2026-08-03T09:32:21.611000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
