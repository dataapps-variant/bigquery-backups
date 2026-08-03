-- job_id: 8fddf971-7ed1-40d7-a41e-7007449ed337
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:00.568000+00:00
-- started: 2026-08-03T10:11:00.636000+00:00
-- ended: 2026-08-03T10:11:00.799000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
