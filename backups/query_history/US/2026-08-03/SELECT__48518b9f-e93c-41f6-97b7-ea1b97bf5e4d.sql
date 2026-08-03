-- job_id: 48518b9f-e93c-41f6-97b7-ea1b97bf5e4d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:54.234000+00:00
-- started: 2026-08-03T10:09:54.294000+00:00
-- ended: 2026-08-03T10:09:54.484000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
