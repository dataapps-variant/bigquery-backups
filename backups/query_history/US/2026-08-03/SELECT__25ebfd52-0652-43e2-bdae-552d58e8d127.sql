-- job_id: 25ebfd52-0652-43e2-bdae-552d58e8d127
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:14.545000+00:00
-- started: 2026-08-03T12:30:14.629000+00:00
-- ended: 2026-08-03T12:30:14.983000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
