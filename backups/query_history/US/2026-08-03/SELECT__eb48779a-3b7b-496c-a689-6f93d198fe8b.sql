-- job_id: eb48779a-3b7b-496c-a689-6f93d198fe8b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:48.960000+00:00
-- started: 2026-08-03T09:31:49.190000+00:00
-- ended: 2026-08-03T09:31:49.909000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
