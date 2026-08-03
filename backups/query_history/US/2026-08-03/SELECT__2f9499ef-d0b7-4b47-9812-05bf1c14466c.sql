-- job_id: 2f9499ef-d0b7-4b47-9812-05bf1c14466c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:40.639000+00:00
-- started: 2026-08-03T09:05:40.731000+00:00
-- ended: 2026-08-03T09:05:40.932000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
