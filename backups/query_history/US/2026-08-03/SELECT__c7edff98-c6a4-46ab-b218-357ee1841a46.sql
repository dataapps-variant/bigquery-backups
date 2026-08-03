-- job_id: c7edff98-c6a4-46ab-b218-357ee1841a46
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:57.413000+00:00
-- started: 2026-08-03T10:10:57.471000+00:00
-- ended: 2026-08-03T10:10:57.651000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
