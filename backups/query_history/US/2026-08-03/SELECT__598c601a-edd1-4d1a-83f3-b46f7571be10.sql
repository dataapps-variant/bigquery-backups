-- job_id: 598c601a-edd1-4d1a-83f3-b46f7571be10
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:00.993000+00:00
-- started: 2026-08-03T09:51:01.079000+00:00
-- ended: 2026-08-03T09:51:01.267000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
