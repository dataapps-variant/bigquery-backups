-- job_id: 624a282d-169d-429f-8bac-43f8c5c79244
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:23.872000+00:00
-- started: 2026-08-03T13:01:24.032000+00:00
-- ended: 2026-08-03T13:01:24.520000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
