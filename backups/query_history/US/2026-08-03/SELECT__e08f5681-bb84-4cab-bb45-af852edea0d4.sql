-- job_id: e08f5681-bb84-4cab-bb45-af852edea0d4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:34.197000+00:00
-- started: 2026-08-03T13:03:34.302000+00:00
-- ended: 2026-08-03T13:03:34.496000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
