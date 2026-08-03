-- job_id: 7b5c7307-c6b6-4e3f-b0b6-ddedeaa49862
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:11:02.451000+00:00
-- started: 2026-08-03T09:11:02.545000+00:00
-- ended: 2026-08-03T09:11:02.707000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
