-- job_id: 9b53f650-6bf0-4d0b-8ce2-71cebd3b139f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:19.273000+00:00
-- started: 2026-08-03T13:02:19.350000+00:00
-- ended: 2026-08-03T13:02:19.637000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
