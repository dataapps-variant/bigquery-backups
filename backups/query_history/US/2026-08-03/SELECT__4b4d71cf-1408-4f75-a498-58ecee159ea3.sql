-- job_id: 4b4d71cf-1408-4f75-a498-58ecee159ea3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:52.887000+00:00
-- started: 2026-08-03T12:37:52.994000+00:00
-- ended: 2026-08-03T12:37:53.176000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
