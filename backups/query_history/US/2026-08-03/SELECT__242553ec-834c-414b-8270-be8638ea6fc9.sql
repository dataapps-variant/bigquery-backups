-- job_id: 242553ec-834c-414b-8270-be8638ea6fc9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:28.800000+00:00
-- started: 2026-08-03T09:13:28.872000+00:00
-- ended: 2026-08-03T09:13:29.155000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
