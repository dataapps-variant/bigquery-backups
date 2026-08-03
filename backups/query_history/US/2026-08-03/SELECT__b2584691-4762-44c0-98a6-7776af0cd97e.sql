-- job_id: b2584691-4762-44c0-98a6-7776af0cd97e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:05.089000+00:00
-- started: 2026-08-03T12:37:05.180000+00:00
-- ended: 2026-08-03T12:37:05.713000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
