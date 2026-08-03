-- job_id: 1e8f2995-ab7c-48d6-9de8-56eb347af53a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:09.830000+00:00
-- started: 2026-08-03T11:51:09.948000+00:00
-- ended: 2026-08-03T11:51:10.134000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
