-- job_id: 6e6e46c0-ffa7-44b0-b564-20159b40f79b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:04.651000+00:00
-- started: 2026-08-03T09:51:04.731000+00:00
-- ended: 2026-08-03T09:51:04.902000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
