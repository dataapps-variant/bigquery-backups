-- job_id: ef4de749-47f5-40f5-a13c-1970ea958cb4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:57.770000+00:00
-- started: 2026-08-03T09:50:57.855000+00:00
-- ended: 2026-08-03T09:50:58.072000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
