-- job_id: 16515d70-6af6-4958-955e-5c844bb530ea
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:19.083000+00:00
-- started: 2026-08-03T11:53:19.137000+00:00
-- ended: 2026-08-03T11:53:19.305000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
