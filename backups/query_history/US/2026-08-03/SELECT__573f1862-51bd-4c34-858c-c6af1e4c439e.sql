-- job_id: 573f1862-51bd-4c34-858c-c6af1e4c439e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:37.849000+00:00
-- started: 2026-08-03T09:32:37.980000+00:00
-- ended: 2026-08-03T09:32:38.158000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
