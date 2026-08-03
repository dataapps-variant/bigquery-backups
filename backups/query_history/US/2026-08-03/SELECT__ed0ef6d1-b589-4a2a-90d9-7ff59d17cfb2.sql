-- job_id: ed0ef6d1-b589-4a2a-90d9-7ff59d17cfb2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:37.202000+00:00
-- started: 2026-08-03T13:03:37.301000+00:00
-- ended: 2026-08-03T13:03:37.529000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
