-- job_id: 3ff95e1c-e829-4fcd-bf97-4f85f400d22d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:35.344000+00:00
-- started: 2026-08-03T09:13:35.439000+00:00
-- ended: 2026-08-03T09:13:35.601000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
