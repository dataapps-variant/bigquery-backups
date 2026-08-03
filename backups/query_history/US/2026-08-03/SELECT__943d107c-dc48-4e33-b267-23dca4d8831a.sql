-- job_id: 943d107c-dc48-4e33-b267-23dca4d8831a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:46.001000+00:00
-- started: 2026-08-03T09:05:46.126000+00:00
-- ended: 2026-08-03T09:05:46.347000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
