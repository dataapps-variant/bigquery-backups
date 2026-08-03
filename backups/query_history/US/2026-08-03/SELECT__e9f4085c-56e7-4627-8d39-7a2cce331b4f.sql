-- job_id: e9f4085c-56e7-4627-8d39-7a2cce331b4f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:20.626000+00:00
-- started: 2026-08-03T10:10:20.719000+00:00
-- ended: 2026-08-03T10:10:20.910000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
