-- job_id: 03b2f0a4-685c-4818-8e81-1a095c6ff981
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:26.931000+00:00
-- started: 2026-08-03T12:38:27.034000+00:00
-- ended: 2026-08-03T12:38:27.206000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
