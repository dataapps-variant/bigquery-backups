-- job_id: de0ed557-9c0b-4b1a-a95c-70735e71b5b6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:43.503000+00:00
-- started: 2026-08-03T13:03:43.578000+00:00
-- ended: 2026-08-03T13:03:43.846000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
