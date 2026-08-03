-- job_id: f72186e8-c2f4-4524-8b07-924d2f754702
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:49.753000+00:00
-- started: 2026-08-03T09:48:49.846000+00:00
-- ended: 2026-08-03T09:48:50.019000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
