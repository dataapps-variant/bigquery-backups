-- job_id: 8aabe750-d347-4bbe-af2d-b94a9605691b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:54.042000+00:00
-- started: 2026-08-03T09:32:54.141000+00:00
-- ended: 2026-08-03T09:32:54.351000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
