-- job_id: 1f43d79a-2cb7-4f33-b55f-8d1c42c0f6fd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:53.072000+00:00
-- started: 2026-08-03T13:01:53.250000+00:00
-- ended: 2026-08-03T13:01:53.764000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
