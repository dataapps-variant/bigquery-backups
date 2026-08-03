-- job_id: 8f1fb23d-a846-4a1c-9e07-59039978584a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:17.796000+00:00
-- started: 2026-08-03T09:13:17.876000+00:00
-- ended: 2026-08-03T09:13:18.042000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
