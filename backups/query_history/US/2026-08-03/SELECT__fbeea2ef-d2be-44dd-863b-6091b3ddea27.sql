-- job_id: fbeea2ef-d2be-44dd-863b-6091b3ddea27
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:14.674000+00:00
-- started: 2026-08-03T10:11:14.778000+00:00
-- ended: 2026-08-03T10:11:14.986000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
