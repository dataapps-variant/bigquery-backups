-- job_id: 354e04d4-0da0-489f-9558-6457baefe2b5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:58.792000+00:00
-- started: 2026-08-03T12:29:58.830000+00:00
-- ended: 2026-08-03T12:29:59.003000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
