-- job_id: 0524a284-3fb4-4644-b116-07a5131d1f32
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:57.136000+00:00
-- started: 2026-08-03T11:52:57.228000+00:00
-- ended: 2026-08-03T11:52:57.394000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
