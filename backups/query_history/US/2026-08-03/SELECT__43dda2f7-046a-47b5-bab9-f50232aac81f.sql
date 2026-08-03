-- job_id: 43dda2f7-046a-47b5-bab9-f50232aac81f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:15.318000+00:00
-- started: 2026-08-03T10:11:15.411000+00:00
-- ended: 2026-08-03T10:11:15.623000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
