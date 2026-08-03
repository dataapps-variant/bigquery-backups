-- job_id: a0922452-965c-4383-9765-219431d93600
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:57.400000+00:00
-- started: 2026-08-03T09:05:57.497000+00:00
-- ended: 2026-08-03T09:05:57.677000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
