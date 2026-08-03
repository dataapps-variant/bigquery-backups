-- job_id: f2bd8f98-869e-4ac9-9258-d2cd73adbcef
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:36.436000+00:00
-- started: 2026-08-03T09:31:36.562000+00:00
-- ended: 2026-08-03T09:31:36.777000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
