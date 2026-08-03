-- job_id: 636f3380-eb9b-43b4-93e3-76dd2f0d5bb4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:39.406000+00:00
-- started: 2026-08-03T09:50:39.498000+00:00
-- ended: 2026-08-03T09:50:39.709000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
