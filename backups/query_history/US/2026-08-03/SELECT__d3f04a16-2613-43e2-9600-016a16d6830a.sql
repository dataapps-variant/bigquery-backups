-- job_id: d3f04a16-2613-43e2-9600-016a16d6830a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:46.450000+00:00
-- started: 2026-08-03T09:32:46.540000+00:00
-- ended: 2026-08-03T09:32:46.734000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
