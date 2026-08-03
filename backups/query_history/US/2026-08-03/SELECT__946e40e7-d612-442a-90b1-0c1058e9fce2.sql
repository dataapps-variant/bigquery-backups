-- job_id: 946e40e7-d612-442a-90b1-0c1058e9fce2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:27.365000+00:00
-- started: 2026-08-03T09:13:27.445000+00:00
-- ended: 2026-08-03T09:13:27.611000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
