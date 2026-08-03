-- job_id: 698fbd0e-1337-476f-b458-49ffcb342e99
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:09:46.551000+00:00
-- started: 2026-08-03T09:09:46.661000+00:00
-- ended: 2026-08-03T09:09:46.863000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
