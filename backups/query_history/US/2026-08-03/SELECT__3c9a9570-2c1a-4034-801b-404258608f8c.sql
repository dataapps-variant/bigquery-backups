-- job_id: 3c9a9570-2c1a-4034-801b-404258608f8c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:27.983000+00:00
-- started: 2026-08-03T12:37:28.100000+00:00
-- ended: 2026-08-03T12:37:28.259000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
