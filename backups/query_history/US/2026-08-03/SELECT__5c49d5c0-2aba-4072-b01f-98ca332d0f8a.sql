-- job_id: 5c49d5c0-2aba-4072-b01f-98ca332d0f8a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:12.341000+00:00
-- started: 2026-08-03T10:11:12.407000+00:00
-- ended: 2026-08-03T10:11:12.606000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
