-- job_id: 112ee58c-0adf-4c6d-b8ba-67b3a9c284fe
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:04:44.775000+00:00
-- started: 2026-08-03T09:04:44.865000+00:00
-- ended: 2026-08-03T09:04:45.061000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
