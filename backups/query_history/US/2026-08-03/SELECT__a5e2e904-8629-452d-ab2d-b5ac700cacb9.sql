-- job_id: a5e2e904-8629-452d-ab2d-b5ac700cacb9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:49.915000+00:00
-- started: 2026-08-03T10:10:49.974000+00:00
-- ended: 2026-08-03T10:10:50.135000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
