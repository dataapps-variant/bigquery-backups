-- job_id: 99ac9837-79b6-42d0-bbef-abde07b53430
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:44.864000+00:00
-- started: 2026-08-03T09:32:44.958000+00:00
-- ended: 2026-08-03T09:32:45.162000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
