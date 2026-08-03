-- job_id: 026f41ee-4075-4cc8-a8e0-45426caadc9b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:54.101000+00:00
-- started: 2026-08-03T10:10:54.183000+00:00
-- ended: 2026-08-03T10:10:54.415000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
