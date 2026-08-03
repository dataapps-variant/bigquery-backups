-- job_id: 6a56b261-4ae4-4399-ba0b-134f26d882a6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:04:46.429000+00:00
-- started: 2026-08-03T09:04:46.521000+00:00
-- ended: 2026-08-03T09:04:46.701000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
