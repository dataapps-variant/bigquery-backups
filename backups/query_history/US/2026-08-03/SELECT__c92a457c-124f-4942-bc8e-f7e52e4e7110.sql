-- job_id: c92a457c-124f-4942-bc8e-f7e52e4e7110
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:04.931000+00:00
-- started: 2026-08-03T09:13:05.010000+00:00
-- ended: 2026-08-03T09:13:05.178000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
