-- job_id: 47d8ddd8-ba94-4bd9-870a-00aa55f3eb13
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:54.398000+00:00
-- started: 2026-08-03T09:05:54.462000+00:00
-- ended: 2026-08-03T09:05:54.611000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
