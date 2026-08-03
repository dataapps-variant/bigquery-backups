-- job_id: 80900b94-4d9c-4411-be80-d165590e5d29
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:17.388000+00:00
-- started: 2026-08-03T13:03:17.458000+00:00
-- ended: 2026-08-03T13:03:17.758000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
