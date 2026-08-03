-- job_id: ebff14c1-2ebe-4496-9090-4908c9572059
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:41.610000+00:00
-- started: 2026-08-03T12:38:41.693000+00:00
-- ended: 2026-08-03T12:38:41.855000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
