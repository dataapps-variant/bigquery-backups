-- job_id: 07e65430-8eb6-485e-a23d-1f60e9d8ff31
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:42.995000+00:00
-- started: 2026-08-03T09:10:43.069000+00:00
-- ended: 2026-08-03T09:10:43.362000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
