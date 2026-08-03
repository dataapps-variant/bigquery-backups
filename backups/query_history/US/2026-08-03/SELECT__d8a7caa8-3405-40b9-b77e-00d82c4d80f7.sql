-- job_id: d8a7caa8-3405-40b9-b77e-00d82c4d80f7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:14.292000+00:00
-- started: 2026-08-03T13:03:14.344000+00:00
-- ended: 2026-08-03T13:03:14.506000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
