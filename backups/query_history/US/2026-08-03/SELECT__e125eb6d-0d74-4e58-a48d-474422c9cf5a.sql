-- job_id: e125eb6d-0d74-4e58-a48d-474422c9cf5a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:55.836000+00:00
-- started: 2026-08-03T12:29:55.896000+00:00
-- ended: 2026-08-03T12:29:56.074000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
